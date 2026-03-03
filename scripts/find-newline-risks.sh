#!/usr/bin/env bash
set -euo pipefail

# Detect adjacent markdown "label" lines that are likely to collapse into
# a single rendered paragraph (for example: **Purpose:** then **Usage:**).
# This scanner ignores YAML front matter, lists, tables, headings, blockquotes,
# callout markers, and fenced code blocks.

targets=(
  core
  deliverables
  guides
  maturity
  templates
  prompts
  INDEX.md
  phase-1-foundation.md
  phase-2-structure.md
  phase-3-strategic-value.md
  phase-4-continuous-improvement.md
)

had_findings=0

while IFS= read -r file; do
  findings="$(
    awk '
      BEGIN { incode=0; inyaml=0 }
      NR==1 && $0=="---" { inyaml=1; next }
      inyaml && $0=="---" { inyaml=0; next }
      inyaml { next }
      /^```/ { incode=!incode; prev=0; next }
      {
        if (incode) next
        if ($0 ~ /^[[:space:]]*$/ || $0 ~ /^[[:space:]]*[-*][[:space:]]/ || $0 ~ /^\|/ || $0 ~ /^>/ || $0 ~ /^\{:/ || $0 ~ /^#{1,6}[[:space:]]/) {
          prev=0
          next
        }
        matched=($0 ~ /^\\*\\*[^*][^*]*:\\*\\*/)
        if (matched && prev) {
          printf "%s:%s and %s => %s || %s\n", FILENAME, prevln, NR, prevtxt, $0
        }
        prev=matched
        prevln=NR
        prevtxt=$0
      }
    ' "$file"
  )"

  if [[ -n "$findings" ]]; then
    had_findings=1
    printf '%s\n' "$findings"
  fi
done < <(rg --files -g '*.md' "${targets[@]}")

if [[ "$had_findings" -eq 0 ]]; then
  echo "No newline-risk stacked label blocks found."
fi
