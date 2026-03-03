# Markdown Formatting Audit Rules

This document defines the rules used by `scripts/markdown-format-audit.sh`.

## R1: Stacked Bold Labels
Pattern: consecutive lines starting with `**Label:** ...` outside lists/blocks.

Risk: lines collapse into a single paragraph in rendered Markdown.

Safe fix: convert each line in the stacked run to a bullet item.

## R2: Bare Emoji Pseudo-Lists
Pattern: lines beginning with emoji markers (for example `✅`, `❌`, `🔴`) without `- `.

Risk: line breaks become renderer-dependent and may compress.

Safe fix: convert to proper markdown bullet items (`- ✅ ...`).

## R3: Unfenced ASCII Box Diagrams
Pattern: contiguous lines that start with box characters (`┌`, `├`, `└`, `│`) outside fenced code blocks.

Risk: markdown interpretation can alter spacing/orientation.

Safe fix: wrap the contiguous block in triple backticks.

Only high-confidence rules are enabled to avoid false positives.
