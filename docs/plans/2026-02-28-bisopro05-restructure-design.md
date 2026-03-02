# BISOPRO-05 Restructure Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Restructure BISOPRO-05 from 1,187 lines of financial-metrics-first to ~800 lines with relationship metrics as the primary focus.

**Architecture:** Complete rewrite of document ordering. Trust Equation moves from line 424 to line ~35. Core document (~350-400 lines) covers relationships and simple business outcomes. Appendix (~400-500 lines) preserves advanced measurement for mature programs. Same file, clear section break.

**Tech Stack:** Markdown, Jekyll front matter, GitHub Pages with Just the Docs theme

**Linear Issue:** FOR-244 — Restructure BISOPRO-05 with Relationship Metrics First

---

## Design Decisions (from brainstorming)

- Trust Equation and relationship metrics move to top of document (line ~35)
- Only the Trust Scorecard ASCII art stays in core; all 6 other ASCII dashboards move to appendix
- Full RACI matrix moves to appendix as-is
- Appendix lives in same file with clear section break
- Target: ~350-400 lines core + ~400-500 lines appendix
- "Measurement Excellence Standards" section cut (aspirational fluff)

## Source Material Map

Current BISOPRO-05 line ranges being reorganized:

| Current Lines | Content | Destination |
|---|---|---|
| 1-6 | Front matter (YAML) | Core: rewrite |
| 8-28 | Executive summary | Core: rewrite |
| 30-55 | Quick navigation | Core: rewrite |
| 58-137 | ASCII dashboards (Business Impact, Operational, Strategic) | Appendix |
| 139-143 | Traffic light legend | Core: keep |
| 147-193 | RACI matrix + data sources | Appendix: as-is |
| 196-262 | Getting Started implementation guide | Appendix (advanced deployment) |
| 265-342 | Baseline establishment process | Core: simplified version |
| 345-401 | Tier 1-2 metrics (Business Impact, Risk) | Appendix (full); Core (simplified) |
| 402-423 | Tier 3 intro (Stakeholder Satisfaction) | Cut (absorbed into Trust Equation section) |
| 424-465 | Trust Equation Scorecard | **Core: MOVE TO TOP** |
| 467-603 | RQI Framework (relationship health, pulse survey, thresholds) | Core: restructured |
| 604-653 | Tier 4-5 metrics (Operational, Strategic) | Appendix |
| 654-771 | Executive reporting templates (3 ASCII dashboards) | Appendix |
| 775-819 | Reporting calendar framework | Appendix |
| 823-895 | Automation implementation guide | Appendix |
| 898-917 | Measurement framework summary | Core: simplified |
| 919-923 | Escalation framework | Core: keep |
| 924-1051 | Continuous improvement process | Appendix |
| 1053-1068 | Measurement Excellence Standards | **CUT** |
| 1072-1151 | Success scenarios & maturity progression | Appendix |
| 1154-1187 | Quick navigation (bottom) | Core: rewrite |

---

## Implementation Tasks

### Task 1: Create feature branch

**Step 1: Create and checkout branch**

```bash
git checkout -b alex/for-244-restructure-bisopro-05-with-relationship-metrics-first
```

**Step 2: Verify clean state**

```bash
git status
```

Expected: clean working tree on new branch

---

### Task 2: Write new core section

**File:** `deliverables/BISOPRO-05_Success_Metrics.md`

Write the complete core section (~350-400 lines) as a new file. Content sources noted inline:

1. **Front matter** — Keep existing YAML, update description
2. **Executive Summary** — NEW. Lead with "no industry-wide BISO metrics" philosophy (from current line 426). Emphasize relationships first.
3. **Quick Navigation** — NEW. Rewritten for new structure (Trust Equation, Pulse Survey, Relationship Health, Business Outcomes, Getting Started, Appendix)
4. **Trust Equation Framework** — MOVE from current lines 424-465. Keep the Trust Scorecard ASCII art. Add scoring guidance, thresholds (from lines 577-594).
5. **Monthly Pulse Survey** — MOVE from current lines 541-558. Keep 5-question survey. Add quarterly/annual cadence summary.
6. **Relationship Health Indicators** — EXTRACT from current lines 467-535. Prose only: engagement quality, advocacy level, RQI thresholds (green/yellow/red). No ASCII dashboard.
7. **Simple Business Outcome Tracking** — SIMPLIFY from current Tiers 1-2, 4. Keep: time-to-market, early security engagement, stakeholder satisfaction, basic operational metrics. Each metric gets 4-5 lines (definition, target, measurement, business value). No dashboards.
8. **Getting Started** — SIMPLIFY from current lines 265-342. First 90 days, baseline establishment (condensed), reporting cadence as prose list.
9. **Cross-references** — UPDATE for new structure. Link to related framework documents.

**Verification:** Line count should be 350-400.

---

### Task 3: Write appendix section

**File:** Same file, appended after core with clear section break.

Assemble appendix from existing content, labeled "For Mature Programs":

1. Section break: `---` + `## Appendix: Advanced Measurement Framework` + "For Mature Programs" label
2. **Full 5-Tier Measurement System** — Current lines 345-653 (Tiers 1-5 with all metric definitions)
3. **Visual Dashboard Templates** — Current lines 58-137 (3 ASCII dashboards: Business Impact, Operational, Strategic)
4. **Executive Reporting Templates** — Current lines 654-771 (Monthly, Quarterly, Annual ASCII templates)
5. **RACI Matrix** — Current lines 147-193 (as-is)
6. **Reporting Calendar** — Current lines 775-819
7. **Automation Guide** — Current lines 823-895
8. **Continuous Improvement** — Current lines 924-1051
9. **Maturity Progression** — Current lines 1072-1151

**CUT entirely:**
- Measurement Excellence Standards (lines 1053-1068)
- Redundant content between tier descriptions and ASCII dashboards
- Duplicate quick navigation at bottom (lines 1154-1187) — core nav at top is sufficient

**Verification:** Appendix line count ~400-500. Total document ~750-900.

---

### Task 4: Verify document integrity

**Step 1: Check all internal cross-references**

Verify all `[text](./FILENAME.md#section)` links point to valid files.

**Step 2: Check internal anchor links**

Verify all `[text](#section-heading)` links match actual headings in restructured doc.

**Step 3: Verify Jekyll front matter**

Confirm YAML front matter renders correctly for GitHub Pages.

**Step 4: Line count check**

```bash
wc -l deliverables/BISOPRO-05_Success_Metrics.md
```

Expected: 750-900 lines total.

---

### Task 5: Commit, push, and create PR

**Step 1: Stage and commit**

```bash
git add deliverables/BISOPRO-05_Success_Metrics.md
git commit -m "Completes FOR-244: Restructure BISOPRO-05 with relationship metrics first

Move Trust Equation from line 424 to document lead. Core section (~400 lines)
focuses on relationship health, pulse surveys, and simple business outcomes.
Advanced measurement (5-tier system, ASCII dashboards, RACI, automation)
preserved in appendix for mature programs.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

**Step 2: Push branch**

```bash
git push -u origin alex/for-244-restructure-bisopro-05-with-relationship-metrics-first
```

**Step 3: Create PR**

```bash
gh pr create --title "Restructure BISOPRO-05: Relationship metrics first" --body "$(cat <<'EOF'
## Summary
- Moves Trust Equation from line 424 to document lead position
- Core section (~400 lines) focuses on relationships, pulse surveys, simple business outcomes
- Advanced measurement preserved in appendix for mature programs
- Reduces practitioner reading burden by 60% for core implementation

## Test plan
- [ ] Verify GitHub Pages renders correctly
- [ ] Check all internal cross-references resolve
- [ ] Confirm Trust Scorecard ASCII art displays properly
- [ ] Validate front matter for Just the Docs navigation

Completes FOR-244

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```
