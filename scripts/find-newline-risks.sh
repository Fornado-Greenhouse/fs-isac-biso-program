#!/usr/bin/env bash
set -euo pipefail

# Backward-compatible wrapper for the newer markdown audit.
scripts/markdown-format-audit.sh --check
