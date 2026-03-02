# BISOPRO-05 Full Normalization Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Fully normalize `deliverables/BISOPRO-05_Success_Metrics.md` by removing decorative emoji, standardizing ASCII directional/status notation, and converting layout-heavy ASCII table blocks into render-safe Markdown tables.

**Architecture:** Apply a deterministic transformation pipeline in one file: token normalization first, then structural table reflow (especially the advanced appendix tail sections), then markdown spacing hardening and validation. Keep metric content intact while modernizing presentation and parsing reliability.

**Tech Stack:** Markdown + Jekyll (Just the Docs/kramdown)

---

### Task 1: Baseline inventory and guardrails

**Files:**
- Modify: `docs/plans/2026-03-02-bisopro05-full-normalization-implementation.md`
- Inspect: `deliverables/BISOPRO-05_Success_Metrics.md`

**Step 1: Capture baseline token counts**
Run:
```bash
rg -n '🟢|🟡|🔴|✅|❌|⬆️|⬇️|➡️|→|←|↔|↑|↓|🚀|📊|💰|⚠️|🏆|🤝|🛡️|⚙️|📈' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: many matches (baseline evidence).

**Step 2: Locate ASCII art heavy blocks**
Run:
```bash
rg -n '┌|├|└|│|┬|┴|─' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: key blocks, especially in appendix and reporting templates.

**Step 3: Record high-risk conversion zones in plan notes**
- Trust Equation scorecard block
- Decision Influence Matrix block
- Visual dashboard templates
- Monthly/Quarterly/Annual executive report templates
- Metrics ownership matrix area
- Reporting calendar framework area

**Step 4: Commit checkpoint**
```bash
git add docs/plans/2026-03-02-bisopro05-full-normalization-implementation.md
git commit -m "Add BISOPRO-05 full normalization implementation plan"
```

### Task 2: Global token normalization (emoji + arrows + status)

**Files:**
- Modify: `deliverables/BISOPRO-05_Success_Metrics.md`

**Step 1: Replace status and directional tokens per contract**
- `🟢` -> `G`
- `🟡` -> `Y`
- `🔴` -> `R`
- `⬆️`/`↑` -> `^`
- `⬇️`/`↓` -> `v`
- `➡️`/`→` -> `->`
- `←` -> `<-`
- `↔` -> `<->`

**Step 2: Remove decorative emoji in headers/labels**
- Remove icons from section titles and template labels while preserving wording.

**Step 3: Verify token cleanup**
Run:
```bash
rg -n '🟢|🟡|🔴|✅|❌|⬆️|⬇️|➡️|→|←|↔|↑|↓|🚀|📊|💰|⚠️|🏆|🤝|🛡️|⚙️|📈' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: no matches.

**Step 4: Commit**
```bash
git add deliverables/BISOPRO-05_Success_Metrics.md
git commit -m "Normalize BISOPRO-05 status and directional notation"
```

### Task 3: Convert trust and matrix ASCII blocks to Markdown tables

**Files:**
- Modify: `deliverables/BISOPRO-05_Success_Metrics.md`

**Step 1: Convert Trust Equation scorecard block**
- Replace fenced box-drawing block with Markdown subsection + table(s):
  - Component
  - Prompt
  - Score field
- Keep formula and scoring semantics unchanged.

**Step 2: Convert Decision Influence Matrix block**
- Replace with standard Markdown table retaining target/actual values and status labels.

**Step 3: Verify no broken fence artifacts in converted sections**
Run:
```bash
rg -n 'BISO TRUST EQUATION SCORECARD|Decision Influence Matrix|```' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: either clean markdown tables or intentional fences only where needed.

**Step 4: Commit**
```bash
git add deliverables/BISOPRO-05_Success_Metrics.md
git commit -m "Convert BISOPRO-05 trust and influence ASCII blocks to Markdown tables"
```

### Task 4: Reflow appendix dashboards and reporting templates

**Files:**
- Modify: `deliverables/BISOPRO-05_Success_Metrics.md`

**Step 1: Convert visual dashboard template boxes**
- Executive Dashboard (Tier 1)
- Operational Dashboard (Tier 2-4)
- Strategic Dashboard (Tier 5)
- Reformat each into:
  - heading
  - short context bullets
  - markdown tables for metrics/status/trend rows

**Step 2: Convert executive reporting template boxes**
- Monthly Executive Dashboard Template
- Quarterly Business Review Template
- Annual Strategic Review Template
- Reformat into table-driven templates preserving placeholders.

**Step 3: Convert any remaining box-drawing structures near the end**
Run:
```bash
rg -n '┌|├|└|│|┬|┴|─' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: no matches.

**Step 4: Commit**
```bash
git add deliverables/BISOPRO-05_Success_Metrics.md
git commit -m "Reformat BISOPRO-05 appendix templates into Markdown tables"
```

### Task 5: Markdown rendering hardening and layout consistency

**Files:**
- Modify: `deliverables/BISOPRO-05_Success_Metrics.md`

**Step 1: Ensure table spacing correctness**
Run:
```bash
awk 'NR==1{prev=""} {if($0 ~ /^\|[^|]+\|/ && prev !~ /^\s*$/ && prev !~ /^\|/ && prev !~ /^```/){print NR":"$0} prev=$0}' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: no output.

**Step 2: Ensure no legacy status legend text with emoji remains**
Run:
```bash
rg -n 'Traffic Light Legend|Status: .*G/Y/R|G\s*\|\s*Y\s*\|\s*R' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: legend reflects ASCII notation and is consistent.

**Step 3: Manual scan of final 40% of document**
Run:
```bash
nl -ba deliverables/BISOPRO-05_Success_Metrics.md | sed -n '520,980p'
```
Expected: readable sections, no visual overflow from pseudo-graphics.

**Step 4: Commit**
```bash
git add deliverables/BISOPRO-05_Success_Metrics.md
git commit -m "Harden BISOPRO-05 markdown layout and table spacing"
```

### Task 6: Verification and publish

**Files:**
- Verify: `deliverables/BISOPRO-05_Success_Metrics.md`

**Step 1: Integrity sweep**
Run:
```bash
rg -n '🟢|🟡|🔴|✅|❌|⬆️|⬇️|➡️|→|←|↔|↑|↓|┌|├|└|│|┬|┴|─' deliverables/BISOPRO-05_Success_Metrics.md
```
Expected: no matches.

**Step 2: Site build check**
Run:
```bash
bundle exec jekyll build
```
Expected: successful build. If environment lacks local Jekyll, document limitation and rely on Pages workflow validation.

**Step 3: Publish**
```bash
git push origin main
```
Expected: Pages workflow triggered.

**Step 4: Live page validation**
Run:
```bash
curl -Ls https://fornado-greenhouse.github.io/fs-isac-biso-program/deliverables/BISOPRO-05_Success_Metrics/ | rg -n 'Trust Equation|Decision Influence Matrix|Monthly Executive Dashboard Template|Quarterly Business Review Template|Annual Strategic Review Template|G|Y|R'
```
Expected: sections render with updated layout and ASCII notation.

**Step 5: Final summary note**
- Document exact normalization rules applied.
- Note any intentionally retained fenced blocks and why.
