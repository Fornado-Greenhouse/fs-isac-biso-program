#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/markdown-format-audit.sh [--check|--fix]

Modes:
  --check   Report formatting risks only (default)
  --fix     Apply safe deterministic fixes, then report remaining risks

Rules:
  R1  Consecutive bold label lines outside lists (e.g., **Purpose:** then **Usage:**)
  R2  Bare emoji pseudo-list lines not prefixed with "- "
  R3  Unfenced ASCII box diagram blocks (lines beginning with box chars)
USAGE
}

mode="check"
if [[ ${1:-} == "--fix" ]]; then
  mode="fix"
elif [[ ${1:-} == "--check" || ${1:-} == "" ]]; then
  mode="check"
else
  usage
  exit 2
fi

files=()
while IFS= read -r f; do
  files+=("$f")
done < <(rg --files -g '*.md' | sort)

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No markdown files found."
  exit 0
fi

report_file="$(mktemp)"
fix_count_file="$(mktemp)"
: > "$report_file"
: > "$fix_count_file"

for file in "${files[@]}"; do
  tmp="$(mktemp)"

  awk -v mode="$mode" -v file="$file" -v report_file="$report_file" -v fix_count_file="$fix_count_file" '
    function report(rule, ln, txt,    cleaned) {
      cleaned=txt
      gsub(/^[[:space:]]+/, "", cleaned)
      if (length(cleaned) > 140) cleaned=substr(cleaned, 1, 137) "..."
      printf "%s:%d:%s:%s\n", file, ln, rule, cleaned >> report_file
      findings++
    }

    function is_bold_label(line) {
      return (line ~ /^\*\*[^*][^*]*:\*\*[[:space:]]*.*$/)
    }

    function is_bare_emoji_line(line,    t) {
      t=line
      sub(/^[[:space:]]+/, "", t)
      return (t ~ /^(✅|❌|🔴|🟢|🟡|🟠|🔵|⚠️|⚠|ℹ️|⭐|🔥|📌|👉|✔️|✖️|❗|❓|🧭|🛑)[[:space:]]+/)
    }

    function is_box_char_line(line,    t) {
      t=line
      sub(/^[[:space:]]+/, "", t)
      return (t ~ /^[┌├└│].*/)
    }

    function flush_label_run(    i) {
      if (label_count >= 2) {
        for (i = 1; i <= label_count; i++) {
          report("R1", label_ln[i], label_line[i])
          if (mode == "fix") {
            out[++out_n] = "- " label_line[i]
            fixes++
          } else {
            out[++out_n] = label_line[i]
          }
        }
      } else if (label_count == 1) {
        out[++out_n] = label_line[1]
      }
      label_count = 0
    }

    function flush_ascii_block(    i) {
      if (ascii_count == 0) return
      report("R3", ascii_ln[1], ascii_line[1])
      if (mode == "fix") {
        out[++out_n] = "```"
        for (i = 1; i <= ascii_count; i++) out[++out_n] = ascii_line[i]
        out[++out_n] = "```"
        fixes++
      } else {
        for (i = 1; i <= ascii_count; i++) out[++out_n] = ascii_line[i]
      }
      ascii_count = 0
    }

    BEGIN {
      in_yaml = 0
      in_code = 0
      findings = 0
      fixes = 0
      out_n = 0
      label_count = 0
      ascii_count = 0
    }

    {
      line = $0
      ln = NR

      if (NR == 1 && line == "---") {
        in_yaml = 1
        out[++out_n] = line
        next
      }

      if (in_yaml) {
        out[++out_n] = line
        if (line == "---") in_yaml = 0
        next
      }

      if (line ~ /^```/) {
        flush_label_run()
        flush_ascii_block()
        in_code = !in_code
        out[++out_n] = line
        next
      }

      if (in_code) {
        out[++out_n] = line
        next
      }

      if (ascii_count > 0) {
        if (is_box_char_line(line)) {
          ascii_ln[++ascii_count] = ln
          ascii_line[ascii_count] = line
          next
        } else {
          flush_ascii_block()
        }
      }

      if (is_box_char_line(line)) {
        flush_label_run()
        ascii_ln[++ascii_count] = ln
        ascii_line[ascii_count] = line
        next
      }

      if (label_count > 0 && !is_bold_label(line)) {
        flush_label_run()
      }

      if (is_bold_label(line)) {
        label_ln[++label_count] = ln
        label_line[label_count] = line
        next
      }

      if (is_bare_emoji_line(line)) {
        report("R2", ln, line)
        if (mode == "fix") {
          sub(/^[[:space:]]*/, "", line)
          out[++out_n] = "- " line
          fixes++
        } else {
          out[++out_n] = $0
        }
        next
      }

      out[++out_n] = line
    }

    END {
      flush_label_run()
      flush_ascii_block()

      for (i = 1; i <= out_n; i++) print out[i]

      if (mode == "fix" && fixes > 0) {
        printf "%s:%d\n", file, fixes >> fix_count_file
      }
    }
  ' "$file" > "$tmp"

  if [[ "$mode" == "fix" ]]; then
    if ! cmp -s "$file" "$tmp"; then
      mv "$tmp" "$file"
    else
      rm -f "$tmp"
    fi
  else
    rm -f "$tmp"
  fi
done

if [[ "$mode" == "fix" ]]; then
  if [[ -s "$fix_count_file" ]]; then
    echo "Applied fixes:"
    sort "$fix_count_file"
  else
    echo "No safe fixes applied."
  fi
fi

if [[ -s "$report_file" ]]; then
  echo "Findings:"
  sort "$report_file"
  rm -f "$report_file" "$fix_count_file"
  exit 1
fi

echo "No formatting risks found by configured rules."
rm -f "$report_file" "$fix_count_file"
exit 0
