# Phase-Aligned Maturity Model Redesign Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Redesign the maturity model so progression aligns to the four implementation phases using criteria-based advancement, with accurate links, cleaner presentation, and correct markdown rendering.

**Architecture:** Replace the current level-based structure in `maturity/maturity_model.md` with a phase-based model (`Foundation`, `Structure`, `Strategic Value`, `Continuous Improvement`). Each phase section will define entry criteria, required linked artifacts, optional accelerators, exit criteria, and anti-patterns. Keep phase color signaling, remove non-semantic emoji, and normalize markdown formatting to avoid rendering issues.

**Tech Stack:** Jekyll + Just the Docs + Markdown (kramdown/GFM)

---

### Task 1: Baseline content inventory and reference map

**Files:**
- Modify: `docs/plans/2026-03-02-maturity-model-phase-aligned-redesign.md`
- Inspect: `maturity/maturity_model.md`
- Inspect: `phase-1-foundation.md`
- Inspect: `phase-2-structure.md`
- Inspect: `phase-3-strategic-value.md`
- Inspect: `phase-4-continuous-improvement.md`
- Inspect: `core/index.md`, `guides/index.md`, `templates/index.md`

**Step 1: Build a source mapping table in this plan doc**
- Add a table mapping old maturity sections to new phase sections.
- Add a table of canonical links that will replace broken refs (`advanced/`, `guides_v2/`, `maturity/level_X`, `MIGRATION_PLAN_V02.md`).

Old-to-new section mapping:

| Existing Section Pattern | Issue | New Section Pattern |
|---|---|---|
| `## Level 1: Quick Start` | Level-centric and timeline gated | `## Phase 1: Foundation (Green)` |
| `## Level 2: Expanding` | Refers to moved/nonexistent docs | `## Phase 2: Structure (Yellow)` |
| `## Level 3: Optimizing` | Uses stale `advanced/` and `guides_v2/` paths | `## Phase 3: Strategic Value (Blue)` |
| `## Level 4: Excellence` | Mixes maturity + thought-leadership without phase anchors | `## Phase 4: Continuous Improvement (Purple)` |
| `## Quick Maturity Self-Assessment` | Checklist emoji and level buckets | `## Phase Readiness Assessment` with criteria-only scoring |
| `## Related Resources` | Contains dead links (`MIGRATION_PLAN_V02`, `maturity/level_X`) | `## Canonical Resource Map` with existing repo links |

Canonical link replacements:

| Broken/Legacy Reference | Replacement Target(s) |
|---|---|
| `/core/` (plain text) | [Core Documents](../core/) and specific docs (e.g., [Program Guide](../core/01_Program_Guide.md)) |
| `advanced/...` | Phase deliverables in `../deliverables/` (BISOPRO-11 through BISOPRO-25 as appropriate) |
| `guides_v2/Technology_Strategy.md` | [Technology Strategy](../guides/BISO_GUIDE-05_Technology_Strategy.md) |
| `maturity/level_X_*.md` | Phase pages: [Phase 1](../phase-1-foundation.md), [Phase 2](../phase-2-structure.md), [Phase 3](../phase-3-strategic-value.md), [Phase 4](../phase-4-continuous-improvement.md) |
| `MIGRATION_PLAN_V02.md` | [Implementation Guide](../guides/BISO_GUIDE-02_Implementation.md), [Roadmap](../guides/BISO_GUIDE-03_Roadmap.md), [Quick Reference](../guides/BISO_GUIDE-01_Quick_Reference.md) |

**Step 2: Verify all target linked files exist**
Run: `rg --files | rg '^(deliverables|guides|core|templates|maturity)/|^phase-[1-4]-'`
Expected: list includes all intended link targets.

**Step 3: Commit planning checkpoint**
```bash
git add docs/plans/2026-03-02-maturity-model-phase-aligned-redesign.md
git commit -m "Add maturity model redesign implementation plan"
```

### Task 2: Replace model scaffold with phase-based criteria framework

**Files:**
- Modify: `maturity/maturity_model.md`

**Step 1: Write failing content checks (manual assertions)**
- Assert there are no `Level 1/2/3/4` section headings left.
- Assert there are top-level sections for all 4 phases.
- Assert each phase includes: Entry Criteria, Required Resources, Optional Accelerators, Exit Criteria, Common Pitfalls.

**Step 2: Run checks to verify current file fails these assertions**
Run: `rg -n '## .*Level [1-4]|## .*Phase 1|## .*Phase 2|## .*Phase 3|## .*Phase 4|### Entry Criteria|### Exit Criteria' maturity/maturity_model.md`
Expected: matches old level headings; missing full phase criteria structure.

**Step 3: Implement minimal structural rewrite**
- Replace level-oriented framework and progression table with phase-oriented framework.
- Use criteria-based progression language only (remove timeline gating language).
- Keep phase color cues as textual labels only (for example: `Phase 1 (Foundation - Green)`).

**Step 4: Re-run checks**
Run: `rg -n '## .*Level [1-4]|## Phase 1: Foundation|## Phase 2: Structure|## Phase 3: Strategic Value|## Phase 4: Continuous Improvement|### Entry Criteria|### Required Resources|### Optional Accelerators|### Exit Criteria|### Common Pitfalls' maturity/maturity_model.md`
Expected: no `Level [1-4]` sections; all phase sections and criteria subsections present.

**Step 5: Commit**
```bash
git add maturity/maturity_model.md
git commit -m "Redesign maturity model around phase-based criteria"
```

### Task 3: Repair and modernize all references and links

**Files:**
- Modify: `maturity/maturity_model.md`

**Step 1: Write failing link checks**
- Assert there are no references to removed paths: `advanced/`, `guides_v2/`, `maturity/level_`, `MIGRATION_PLAN_V02.md`.

**Step 2: Verify failure in current content**
Run: `rg -n 'advanced/|guides_v2/|maturity/level_|MIGRATION_PLAN_V02' maturity/maturity_model.md`
Expected: one or more matches before replacement.

**Step 3: Implement link replacements with canonical relative links**
- Replace stale path references with existing documents under:
  - `./phase-1-foundation.md` ... `./phase-4-continuous-improvement.md` (or root-relative for clarity)
  - `../deliverables/...`
  - `../guides/...`
  - `../core/...`
  - `../templates/...`
- Ensure every “required resource” bullet is a clickable relative markdown link.

**Step 4: Verify link cleanup**
Run: `rg -n 'advanced/|guides_v2/|maturity/level_|MIGRATION_PLAN_V02' maturity/maturity_model.md`
Expected: no matches.

**Step 5: Commit**
```bash
git add maturity/maturity_model.md
git commit -m "Replace stale maturity-model references with canonical links"
```

### Task 4: Remove non-semantic emoji and preserve phase color signaling

**Files:**
- Modify: `maturity/maturity_model.md`

**Step 1: Define allowed icon policy in-file**
- Keep only phase color indicators in headings/labels.
- Remove checklist glyphs (`✅`, `❌`) and other decorative emoji.

**Step 2: Verify current content fails policy**
Run: `rg -n '✅|❌|🟢|🟡|🔵|🟣|🎯|📚' maturity/maturity_model.md`
Expected: matches present.

**Step 3: Apply cleanup**
- Convert checkmark/X bullet items into plain criteria bullets.
- Replace heavy emoji headers with plain markdown headings.
- Preserve phase color cues as text labels.

**Step 4: Re-verify**
Run: `rg -n '✅|❌|🎯|📚' maturity/maturity_model.md`
Expected: no matches.

**Step 5: Commit**
```bash
git add maturity/maturity_model.md
git commit -m "Normalize maturity model visual style and remove decorative emoji"
```

### Task 5: Fix header/newline rendering and markdown robustness

**Files:**
- Modify: `maturity/maturity_model.md`

**Step 1: Identify likely render-fragile blocks**
- Top document metadata intro block (`Purpose`, `Philosophy`, `Based on`).
- Any heading immediately followed by table without blank line.
- Any table or code fence spacing inconsistencies.

**Step 2: Verify current issue markers**
Run: `nl -ba maturity/maturity_model.md | sed -n '1,60p'`
Expected: header block currently stacked in a way that may collapse on render.

**Step 3: Implement formatting hardening**
- Convert top metadata lines into a bullet list under a `## Overview` section.
- Ensure blank lines around tables and fenced blocks.
- Keep markdown tables standard (no ASCII-art table conversion).

**Step 4: Run spacing sanity checks**
Run: `awk 'NR==1{prev=""} {if($0 ~ /^\|[^|]+\|/ && prev !~ /^\s*$/ && prev !~ /^\|/){print NR":"$0} prev=$0}' maturity/maturity_model.md`
Expected: no output.

**Step 5: Commit**
```bash
git add maturity/maturity_model.md
git commit -m "Fix maturity model header and markdown rendering spacing"
```

### Task 6: Final verification and publish

**Files:**
- Verify: `maturity/maturity_model.md`

**Step 1: Content integrity checks**
Run: `rg -n 'Level 1|Level 2|Level 3|Level 4|advanced/|guides_v2/|maturity/level_|MIGRATION_PLAN_V02|✅|❌' maturity/maturity_model.md`
Expected: no matches.

**Step 2: Site build verification**
Run: `bundle exec jekyll build`
Expected: successful build without markdown parse warnings.

**Step 3: Publish**
```bash
git push origin main
```
Expected: Pages workflow starts.

**Step 4: Post-deploy validation**
Run: `curl -Ls https://fornado-greenhouse.github.io/fs-isac-biso-program/maturity/maturity_model/ | rg -n '<a href=|<table|Overview|Phase 1: Foundation|Phase 4: Continuous Improvement'`
Expected: updated sections present, links rendered, tables rendered where applicable.

**Step 5: Commit summary note in PR/issue context**
- Summarize structural redesign, link repairs, emoji cleanup policy, and rendering fixes.
