# Content Quality Sprint: Feb 10 → March 1, 2026

## Goal
Make existing BISO framework documents genuinely practitioner-friendly. No restructuring, no new directories, no breaking GitHub Pages.

## Context
- GitHub Pages deployed and live with current structure (Just the Docs theme, sidebar nav, search, SEO)
- v0.2 restructure plan (FOR-263 through FOR-278) is obsolete — Pages solved the discoverability problem
- Templates already extracted (Trust Equation Scorecard, Monthly Pulse Survey)
- Focus: simplify bloated docs, reframe prescriptive content as methodology

## Issue Triage

### Closed as Done (3 issues)
- **FOR-239**: Trust Equation Scorecard → already at `templates/02_Trust_Equation_Scorecard.md`
- **FOR-240**: Monthly Pulse Survey → already at `templates/03_Monthly_Pulse_Survey.md`
- **FOR-238**: Epic parent of 239/240 → children done

### Cancelled (24 issues — obsolete v0.2 restructure)
- FOR-263 through FOR-278 (16 issues): Directory reorganization + release
- FOR-252, FOR-269, FOR-270, FOR-271, FOR-272, FOR-274: v0.2 doc updates
- FOR-256, FOR-257, FOR-258: Template extractions superseded by existing templates

### Dates Cleared (15 issues — CISO Work Cycle Duplicates)
- FOR-180, FOR-183, FOR-194, FOR-195, FOR-196, FOR-197, FOR-209
- FOR-237, FOR-245, FOR-247, FOR-248, FOR-249, FOR-250, FOR-251, FOR-253

### Active Sprint (5 issues)

## Timeline

### Week 1: Foundation Work (Feb 10-16)

**FOR-244: Restructure BISOPRO-05 with Relationship Metrics First** → Due Feb 14
- Move Trust Equation from line 421 to top of document
- Lead with relationship quality indicators
- Demote financial ROI metrics to "Advanced Measurement" section
- Simplify from 1,181 lines to ~600 focused lines
- Preserve cross-references to templates/02_Trust_Equation_Scorecard.md

**FOR-242: Restructure BISOPRO-11 with Relationship Value First** → Due Feb 16
- Lead with strategic rationale (cost of inaction, competitive necessity)
- Reframe from prescriptive ROI ($4.8M) to methodology ("build YOUR business case")
- Remove specific salary prescriptions
- Keep powerful data (78% of peers, $6.5M cost of inaction) as inputs not promises

### Week 2: Epic Completion & Quick Start (Feb 17-25)

**FOR-243: Simplify BISOPRO-05 Success Metrics (epic close)** → Due Feb 19
- QA pass on restructured BISOPRO-05
- Verify all cross-references still work
- Confirm GitHub Pages renders correctly

**FOR-241: Reframe BISOPRO-11 Business Case (epic close)** → Due Feb 21
- QA pass on restructured BISOPRO-11
- Verify all cross-references still work
- Confirm GitHub Pages renders correctly

**FOR-246: Consolidate Charter + 11-Step Approach** → Due Feb 25
- Merge BISOPRO-01 Charter essentials with whitepaper's 11-step approach
- Create consolidated Quick Start Guide in core/
- Link from README and INDEX.md

### Week 3: Buffer (Feb 26 - March 1)
- Overflow from any delayed work
- Final QA pass across all modified documents
- Verify GitHub Pages site renders all changes correctly
- Update INDEX.md cross-references if needed

## Dependencies
```
FOR-244 (BISOPRO-05 restructure) → FOR-243 (epic close)
FOR-242 (BISOPRO-11 restructure) → FOR-241 (epic close)
FOR-243 + FOR-241 → FOR-246 (Quick Start builds on simplified docs)
```

## Success Criteria
- BISOPRO-05 leads with Trust Equation, not financial metrics
- BISOPRO-11 teaches methodology, not prescriptive numbers
- Quick Start Guide exists as a single entry point
- All changes render correctly on GitHub Pages
- All cross-references intact
