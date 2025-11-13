# Linear Project Cleanup Summary - V0.2 Transformation

**Date:** 2025-11-13
**Purpose:** Document Linear issue cleanup aligned with v0.2 architecture

---

## Issues to Close (v0.1 "Quick Start Kit" Approach - Now Obsolete)

### Epic: FOR-245 - Create BISO Quick Start Kit (7 Essential Documents)
**Status:** Backlog → **CLOSE**
**Reason:** v0.2 architecture already created 7 core documents with different approach
- v0.1 plan: Consolidate existing BISOPRO docs into "Quick Start Kit"
- v0.2 reality: Built fresh `core/` documents from ground up following transformation principles

### FOR-236 - Create Stakeholder Mapping Template (Power/Interest Matrix)
**Status:** In Progress → **CLOSE (Complete)**
**Reason:** Already completed and merged (PR #107)
- Template exists at templates/BISO_TEMPLATE-01_Stakeholder_Mapping.md
- Can be moved to templates/01 in Phase 2 reorganization

### FOR-237 - Create BISO Service Catalog
**Status:** Unknown (need to check) → **CLOSE (Complete)**
**Reason:** Already built as core/02_Service_Catalog.md in Phase 1

### FOR-247 - Consolidate Alignment Model + Reporting Structure
**Status:** Backlog → **CLOSE (Obsolete)**
**Reason:** Already built as core/03_Organizational_Design.md in Phase 1
- Consolidates BISOPRO-03 and BISOPRO-07 as planned
- Follows transformation principles (5-10 pages, no financial prescriptions)

### FOR-248 - Simplify BISOPRO-08 Job Descriptions
**Status:** Backlog → **CLOSE (Obsolete)**
**Reason:** Already built as core/04_Role_Definitions.md in Phase 1
- Removes salary prescriptions as planned
- Focuses on competencies and hiring profiles

### FOR-249 - Create Stakeholder Engagement Toolkit
**Status:** Backlog → **CLOSE (Obsolete)**
**Reason:** Already built as core/05_Stakeholder_Engagement.md in Phase 1
- Includes Trust Equation framework
- Power-Interest Matrix
- Engagement strategies by stakeholder type

### FOR-250 - Streamline BISOPRO-21 Common Challenges
**Status:** Backlog → **CLOSE (Obsolete)**
**Reason:** Already built as core/07_Common_Challenges.md in Phase 1
- 7 common challenges with practical solutions
- Immediately actionable guidance

### FOR-251 - Create Trust Equation & Success Measurement Quick Start Guide
**Status:** Backlog → **CLOSE (Obsolete)**
**Reason:** Already built as core/06_Success_Measurement.md in Phase 1
- Trust Equation as primary metric
- Progressive measurement framework
- Relationship metrics first

### FOR-253 - Document Consolidation Recommendations
**Status:** Backlog → **CLOSE (Obsolete)**
**Reason:** v0.2 approach differs - moves docs to /advanced/ by theme, doesn't consolidate/remove
- v0.1 plan: Remove/consolidate Tier 4 docs
- v0.2 plan: Preserve all docs in /advanced/, organize by theme

---

## Issues to UPDATE (Repurpose for v0.2)

### FOR-252 - Update README and INDEX with Quick Start Kit Navigation
**Status:** Backlog → **UPDATE for Phase 5**
**New Focus:** Update README and INDEX for v0.2 architecture
- Lead with /core/ (7 documents)
- Show progressive complexity: core/ → templates/ → maturity/ → advanced/
- Update all navigation for new directory structure

### FOR-235 - Build Missing Practitioner Templates from Whitepapers
**Status:** In Progress → **UPDATE/CLOSE**
**Reason:** Epic partially complete
- FOR-236 done (stakeholder mapping)
- FOR-237 done (service catalog now in core/02)
- Can close epic or repurpose for Phase 2 template extraction

---

## New Issues to CREATE (Phases 2-6)

### Phase 2: Template Extraction (5 issues)
1. **Extract Trust Equation Scorecard Template** (templates/02 from core/06)
2. **Extract Monthly Pulse Survey Template** (templates/03 from core/06)
3. **Extract Risk Assessment Worksheet Template** (templates/04 from BISOPRO-12)
4. **Extract Business Case Builder Template** (templates/05 from BISOPRO-11)
5. **Extract Consultation Request Form Template** (templates/06 from BISOPRO-17)

### Phase 3: Maturity Guides (4 issues)
6. **Build Level 1 Quick Start Guide** (maturity/level_1_quick_start.md)
7. **Build Level 2 Expanding Guide** (maturity/level_2_expanding.md)
8. **Build Level 3 Optimizing Guide** (maturity/level_3_optimizing.md)
9. **Build Level 4 Excellence Guide** (maturity/level_4_excellence.md)

### Phase 4: Advanced Reorganization (6 issues)
10. **Reorganize Alignment Theme Docs** (advanced/alignment/)
11. **Reorganize Strategy Theme Docs** (advanced/strategy/)
12. **Reorganize Operations Theme Docs** (advanced/operations/)
13. **Reorganize People Theme Docs** (advanced/people/)
14. **Reorganize Governance Theme Docs** (advanced/governance/)
15. **Update All Cross-References for v0.2 Structure**

### Phase 5: Navigation (4 new + 1 repurposed = 5 total)
16. **Rewrite README.md for v0.2 Architecture**
17. **Update INDEX.md for v0.2** (REPURPOSE FOR-252)
18. **Update CLAUDE.md Conventions for v0.2**
19. **Create v0.2 Migration Notes Documentation**
20. **Update Master Implementation Tracker for v0.2**

### Phase 6: Cleanup (6 issues)
21. **Archive /deliverables/ Directory**
22. **Consolidate Implementation Guides to /guides_v2/**
23. **Update Linear Issue Path References**
24. **Create v0.2 Release Notes**
25. **Tag v0.2-Beta Release**
26. **v0.2 Final Quality Assurance**

---

## Summary

**Total Issues to Close:** 9 (FOR-236, FOR-245, FOR-247, FOR-248, FOR-249, FOR-250, FOR-251, FOR-253, and potentially FOR-237)
**Total Issues to Update:** 1-2 (FOR-252, possibly FOR-235)
**Total New Issues to Create:** 26

**Cleanup Actions:**
1. Close 9 obsolete v0.1 issues with note explaining v0.2 supersedes them
2. Update FOR-252 with v0.2 navigation focus
3. Create 26 new issues aligned with MIGRATION_PLAN_V02.md phases

---

## Next Steps

1. Execute Linear cleanup (close obsolete issues)
2. Create Phase 1 PR (merge core/ work to main)
3. Create new Phase 2-6 issues in batches
4. Begin Phase 2 work (template extraction)
