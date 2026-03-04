# BISO-1 Overview V2 Alignment Plan

## Goal
Verify section-by-section and paragraph-by-paragraph alignment between the 2025 FS-ISAC overview (`BISO-1-Overview_V2.docx`) and the repository guidance, then remediate any conflicts.

## Scope
- Source of truth (external): `docs/alignment/BISO-1-Overview_V2.cleaned.txt`
- Paragraph index: `docs/alignment/BISO-1-Overview_V2.section_paragraphs.tsv`
- Repository corpus: `core/`, `deliverables/`, `guides/`, `maturity/`, `templates/`, `INDEX.md`

## Alignment Decision Rules
- `Exact`: same guidance and intent.
- `Aligned`: same intent, different wording.
- `Extension`: repo adds detail without contradiction.
- `Conflict`: repo contradicts source guidance.
- `Gap`: source guidance not represented in repo.

## Process
1. Build paragraph-level crosswalk from source sections to repo evidence.
2. Cite primary repo location and optional supporting references.
3. Classify each paragraph using the decision rules.
4. Aggregate findings by section and severity:
   - P0: conflicts with role boundaries, risk ownership, reporting/escalation, or core implementation steps.
   - P1: major guidance gaps in responsibilities/service catalog/build steps.
   - P2: minor wording/order differences.
5. Apply remediation in waves (P0 -> P1 -> P2), then re-audit.

## Outputs
- Full matrix: paragraph-level traceability with status and remediation notes.
- Remediation log: exact files/sections edited and why.
- Final conformance summary: counts by status and unresolved risks.

## First Batch
- `Executive Summary`
- `Scoping the BISO Role`
