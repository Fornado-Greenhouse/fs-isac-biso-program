#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/markdown-link-hygiene.sh [--check|--fix]

Modes:
  --check   Report unlinked markdown filename references (default)
  --fix     Auto-fix high-confidence references, then report remaining findings

Notes:
- Auto-fix is intentionally conservative.
- It only rewrites lines like:
  - **Some_File.md** - Description
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

repo_root="$(pwd)"
all_files="$(rg --files -g '*.md' | sort)"

resolve_ref() {
  local current_file="$1"
  local ref="$2"
  local current_dir target matches count
  current_dir="$(dirname "$current_file")"

  if [[ "$ref" == ./* || "$ref" == ../* || "$ref" == */* ]]; then
    target="$current_dir/$ref"
    if [[ -f "$target" ]]; then
      printf '%s\n' "$ref"
      return 0
    fi
    # Support repo-root-relative references like core/01_Program_Guide.md
    if [[ "$ref" == */* && "$ref" != ./* && "$ref" != ../* && -f "$repo_root/$ref" ]]; then
      ruby -e 'require "pathname"; t=Pathname.new(File.expand_path(ARGV[0])); d=Pathname.new(File.expand_path(ARGV[1])); puts t.relative_path_from(d).to_s' "$repo_root/$ref" "$repo_root/$current_dir"
      return 0
    fi
    return 1
  fi

  if [[ -f "$current_dir/$ref" ]]; then
    printf './%s\n' "$ref"
    return 0
  fi

  matches="$(printf '%s\n' "$all_files" | rg -n "(^|/)${ref}$" | sed 's/^[0-9]*://')"
  if [[ -z "$matches" ]]; then
    return 1
  fi

  count="$(printf '%s\n' "$matches" | sed '/^$/d' | wc -l | tr -d ' ')"
  if [[ "$count" != "1" ]]; then
    return 1
  fi

  target="$(printf '%s\n' "$matches")"

  ruby -e 'require "pathname"; t=Pathname.new(File.expand_path(ARGV[0])); d=Pathname.new(File.expand_path(ARGV[1])); puts t.relative_path_from(d).to_s' "$repo_root/$target" "$repo_root/$current_dir"
}

report_file="$(mktemp)"
fix_count_file="$(mktemp)"
: > "$report_file"
: > "$fix_count_file"

while IFS= read -r file; do
  tmp="$(mktemp)"
  in_code=0
  in_yaml=0
  line_no=0
  fixes=0

  while IFS= read -r line || [[ -n "$line" ]]; do
    line_no=$((line_no + 1))

    if [[ $line_no -eq 1 && "$line" == "---" ]]; then
      in_yaml=1
      printf '%s\n' "$line" >> "$tmp"
      continue
    fi

    if [[ $in_yaml -eq 1 ]]; then
      printf '%s\n' "$line" >> "$tmp"
      if [[ "$line" == "---" ]]; then
        in_yaml=0
      fi
      continue
    fi

    if [[ "$line" =~ ^\`\`\` ]]; then
      in_code=$((1 - in_code))
      printf '%s\n' "$line" >> "$tmp"
      continue
    fi

    if [[ $in_code -eq 1 ]]; then
      printf '%s\n' "$line" >> "$tmp"
      continue
    fi

    # Report only high-confidence unlinked filename bullets
    # Pattern A: - **Some_File.md** - Description
    # Pattern B: - **path/to/file.md**: Description
    if [[ "$line" != *"]("* ]]; then
      trimmed="${line#${line%%[![:space:]]*}}"
      if [[ "$trimmed" =~ ^-[[:space:]]+\*\*([^*]+\.md)\*\*([[:space:]]*[-:].*)?$ ]]; then
        printf '%s:%d:U1:%s\n' "$file" "$line_no" "$trimmed" >> "$report_file"
      fi
    fi

    if [[ "$mode" == "fix" ]]; then
      # High-confidence rule: bullet line with bold filename reference
      if [[ "$line" =~ ^([[:space:]]*-[[:space:]]*)\*\*([^*]+\.md)\*\*(.*)$ ]]; then
        prefix="${BASH_REMATCH[1]}"
        ref="${BASH_REMATCH[2]}"
        suffix="${BASH_REMATCH[3]}"

        if link="$(resolve_ref "$file" "$ref")" && [[ -n "$link" ]]; then
          printf '%s[%s](%s)%s\n' "$prefix" "$ref" "$link" "$suffix" >> "$tmp"
          fixes=$((fixes + 1))
          continue
        fi
      fi
    fi

    printf '%s\n' "$line" >> "$tmp"
  done < "$file"

  if [[ "$mode" == "fix" ]]; then
    if ! cmp -s "$file" "$tmp"; then
      mv "$tmp" "$file"
    else
      rm -f "$tmp"
    fi
    if [[ $fixes -gt 0 ]]; then
      printf '%s:%d\n' "$file" "$fixes" >> "$fix_count_file"
    fi
  else
    rm -f "$tmp"
  fi
done < <(printf '%s\n' "$all_files")

if [[ "$mode" == "fix" ]]; then
  if [[ -s "$fix_count_file" ]]; then
    echo "Applied fixes:"
    sort "$fix_count_file"
  else
    echo "No fixes applied."
  fi
fi

if [[ -s "$report_file" ]]; then
  echo "Findings:"
  sort "$report_file"
  rm -f "$report_file" "$fix_count_file"
  exit 1
fi

echo "No unlinked markdown filename references found by configured rules."
rm -f "$report_file" "$fix_count_file"
exit 0
