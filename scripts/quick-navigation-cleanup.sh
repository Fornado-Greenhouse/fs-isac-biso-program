#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/quick-navigation-cleanup.sh [--check|--fix]

Modes:
  --check   Report quick-navigation sections and inline references (default)
  --fix     Remove those sections/references from deliverables, then report remaining

Scope:
  deliverables/*.md

Removals:
  - H2/H3 headings named "Quick Navigation" or "Quick Reference Navigation"
    (including emoji-prefixed variants), and their nested content until next
    heading at same/higher level.
  - Inline helper line: *See [Quick Navigation](#quick-navigation) ...*
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

mapfile_fallback() {
  while IFS= read -r line; do
    files+=("$line")
  done < <(rg --files deliverables -g '*.md' | sort)
}

files=()
mapfile_fallback

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No deliverable markdown files found."
  exit 0
fi

report_file="$(mktemp)"
fix_file="$(mktemp)"
: > "$report_file"
: > "$fix_file"

for file in "${files[@]}"; do
  tmp="$(mktemp)"

  awk -v mode="$mode" -v file="$file" -v report_file="$report_file" -v fix_file="$fix_file" '
    function heading_level(line,    i,c) {
      c=0
      for (i=1; i<=length(line); i++) {
        if (substr(line,i,1)=="#") c++
        else break
      }
      return c
    }

    function is_quick_nav_heading(line,    t) {
      t=line
      sub(/^[[:space:]]+/, "", t)
      # strip heading hashes
      sub(/^#{1,6}[[:space:]]+/, "", t)
      # strip common emoji prefixes and punctuation
      sub(/^[^A-Za-z0-9]*[[:space:]]*/, "", t)
      return (t ~ /^Quick Navigation[[:space:]]*$/ || t ~ /^Quick Reference Navigation[[:space:]]*$/)
    }

    BEGIN {
      in_remove=0
      remove_level=0
      fixes=0
    }

    {
      line=$0

      if (!in_remove) {
        if (line ~ /^#{1,6}[[:space:]]+/ && is_quick_nav_heading(line)) {
          lvl=heading_level(line)
          in_remove=1
          remove_level=lvl
          printf "%s:%d:Q1:%s\n", file, NR, line >> report_file
          if (mode=="fix") fixes++
          next
        }

        if (line ~ /^\*See \[Quick Navigation\]\(#quick-navigation\).*\*$/) {
          printf "%s:%d:Q2:%s\n", file, NR, line >> report_file
          if (mode=="fix") {
            fixes++
            next
          }
        }

        print line
        next
      }

      # currently removing a quick-nav section; stop on same/higher heading
      if (line ~ /^#{1,6}[[:space:]]+/) {
        lvl=heading_level(line)
        if (lvl <= remove_level) {
          in_remove=0
          remove_level=0

          # this new heading itself could also be quick nav
          if (line ~ /^#{1,6}[[:space:]]+/ && is_quick_nav_heading(line)) {
            lvl=heading_level(line)
            in_remove=1
            remove_level=lvl
            printf "%s:%d:Q1:%s\n", file, NR, line >> report_file
            if (mode=="fix") fixes++
            next
          }

          # process this line normally after closing removal
          if (line ~ /^\*See \[Quick Navigation\]\(#quick-navigation\).*\*$/) {
            printf "%s:%d:Q2:%s\n", file, NR, line >> report_file
            if (mode=="fix") {
              fixes++
              next
            }
          }

          print line
          next
        }
      }

      # still within removed block: drop line
      next
    }

    END {
      if (mode=="fix" && fixes>0) {
        printf "%s:%d\n", file, fixes >> fix_file
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
  if [[ -s "$fix_file" ]]; then
    echo "Applied fixes:"
    sort "$fix_file"
  else
    echo "No quick-navigation fixes applied."
  fi
fi

if [[ -s "$report_file" ]]; then
  echo "Findings:"
  sort "$report_file"
  rm -f "$report_file" "$fix_file"
  exit 1
fi

echo "No quick-navigation sections/references found in deliverables."
rm -f "$report_file" "$fix_file"
exit 0
