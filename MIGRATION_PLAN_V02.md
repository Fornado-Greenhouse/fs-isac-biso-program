# V0.2 Architecture Migration Plan

**Date:** 2025-11-13
**Status:** IN PROGRESS - Architecture Phase
**Vision:** Transform from comprehensive-first to practitioner-first framework

---

## The Bold Vision

Transform the FS-ISAC BISO Framework from **30 overwhelming documents** into a **progressive maturity model** that starts simple and scales with program growth.

### Before (v0.1):
```
30 documents → 300+ pages → 40+ hours → Overwhelming
No clear entry point, everything treated as equally important
```

### After (v0.2):
```
START: /core/ (7 docs, 50-70 pages, 4-5 hours)
USE: /templates/ (fill-in-the-blank tools)
GROW: /maturity/ (roadmap from simple → complex)
REFERENCE: /advanced/ (comprehensive depth when needed)
```

---

## New Directory Structure

```
fs-isac-biso-program/
│
├── core/                           ← PRIMARY FRAMEWORK (START HERE)
│   ├── 01_Program_Guide.md
│   ├── 02_Service_Catalog.md
│   ├── 03_Organizational_Design.md
│   ├── 04_Role_Definitions.md
│   ├── 05_Stakeholder_Engagement.md
│   ├── 06_Success_Measurement.md
│   └── 07_Common_Challenges.md
│
├── templates/                      ← PRACTITIONER TOOLS
│   ├── 01_Stakeholder_Mapping.md         ✅ DONE (FOR-236)
│   ├── 02_Trust_Equation_Scorecard.md
│   ├── 03_Monthly_Pulse_Survey.md
│   ├── 04_Risk_Assessment_Worksheet.md
│   ├── 05_Business_Case_Builder.md
│   └── 06_Consultation_Request_Form.md
│
├── maturity/                       ← GROWTH ROADMAP (NEW)
│   ├── maturity_model.md
│   ├── level_1_quick_start.md
│   ├── level_2_expanding.md
│   ├── level_3_optimizing.md
│   └── level_4_excellence.md
│
├── advanced/                       ← COMPREHENSIVE REFERENCE
│   ├── alignment/
│   │   ├── BISOPRO-03_Alignment_Model.md
│   │   └── BISOPRO-07_Reporting_Structure.md
│   ├── strategy/
│   │   ├── BISOPRO-11_Business_Case_ROI.md
│   │   ├── BISOPRO-12_Risk_Assessment.md
│   │   ├── BISOPRO-15_Strategic_Alignment.md
│   │   └── BISOPRO-16_Competitive_Analysis.md
│   ├── operations/
│   │   ├── BISOPRO-09_Key_Processes.md
│   │   └── BISOPRO-17_Consultation_Framework.md
│   ├── people/
│   │   ├── BISOPRO-08_Job_Descriptions.md
│   │   ├── BISOPRO-19_Training.md
│   │   ├── BISOPRO-20_Professional_Development.md
│   │   ├── BISOPRO-23_Core_Competencies.md
│   │   └── BISOPRO-24_Recruitment_Strategy.md
│   └── governance/
│       ├── BISOPRO-04_Stakeholder_Engagement_Protocols.md
│       ├── BISOPRO-05_Success_Metrics.md
│       ├── BISOPRO-06_Authority_Framework.md
│       └── BISOPRO-21_Challenge_Mitigation.md
│
├── guides_v2/                      ← IMPLEMENTATION GUIDANCE
│   ├── Implementation_Roadmap.md
│   ├── Technology_Strategy.md
│   └── Customization_Guide.md
│
├── deliverables/                   ← DEPRECATED (to be moved to advanced/)
├── guides/                         ← DEPRECATED (to be consolidated to guides_v2/)
├── templates/                      ← ACTIVE (growing)
├── docs/                           ← Internal (gitignored)
│
├── INDEX.md                        ← TO UPDATE
├── README.md                       ← TO UPDATE (new start here)
└── CLAUDE.md                       ← TO UPDATE (new conventions)
```

---

## The Maturity Model (4 Levels)

### 🟢 Level 1: Quick Start (Weeks 1-12)
**Who:** New programs, pilots, small orgs (1-2 BISOs)

**What to Use:**
- `/core/` - All 7 documents only
- `/templates/` - 01, 02, 03 (stakeholder mapping, trust equation, pulse survey)
- Manual processes (Excel, email, meetings)

**What to Skip:**
- Financial ROI models
- Comprehensive processes
- Technology automation
- Advanced metrics

**Success:** 1-2 BISOs deployed, stakeholders engaged, trust building

---

### 🟡 Level 2: Expanding (Months 4-9)
**Who:** Scaling programs, adding BISOs (3-5 total)

**What to Add:**
- `/templates/` - 04, 05, 06 (risk assessment, business cases, consultation)
- `/advanced/operations/` - BISOPRO-17 (consultation framework)
- `/advanced/governance/` - BISOPRO-04 (detailed engagement)
- Semi-automated (CRM, dashboards)

**New Capabilities:**
- Formal consultation services
- Structured risk assessments
- Stakeholder satisfaction measurement
- Basic ROI tracking

**Success:** 3-5 BISOs, consistent engagement, measurable value

---

### 🔵 Level 3: Optimizing (Months 10-18)
**Who:** Mature programs, enterprise deployment (7-10+ BISOs)

**What to Add:**
- `/advanced/strategy/` - BISOPRO-11, 12, 15 (business case, risk, alignment)
- `/advanced/operations/` - BISOPRO-09 (comprehensive processes)
- `/advanced/people/` - BISOPRO-19, 20 (training, development)
- Automated processes (workflow integration, APIs)

**New Capabilities:**
- Comprehensive process framework
- Strategic business alignment
- Executive briefing frameworks
- Professional development programs

**Success:** 7-10+ BISOs, enterprise integration, 4:1 ROI

---

### 🟣 Level 4: Excellence (18+ months)
**Who:** Industry-leading programs, thought leadership

**What to Add:**
- Full `/advanced/` framework
- Custom extensions
- Industry collaboration (BISOPRO-22)
- Competitive differentiation (BISOPRO-16)

**New Capabilities:**
- Program evolution/continuous improvement
- Industry thought leadership
- BISO career frameworks
- Competitive advantage through security

**Success:** Industry recognition, measurable competitive advantage

---

## Core Document Specifications

Each `/core/` document must be:
- ✅ **Standalone**: No dependencies, can be read alone
- ✅ **Practitioner-first**: Immediately actionable
- ✅ **Relationship-focused**: Trust > financials
- ✅ **5-10 pages**: Concise, scannable
- ✅ **Whitepaper-aligned**: Based on FS-ISAC guidance
- ✅ **Example-driven**: Real scenarios, not theory
- ✅ **Smart Brevity**: Clear, direct, no fluff

### Content Transformation Rules

**From BISOPRO docs → core docs:**
1. **Extract essence** (5-10 pages from 50-100 page docs)
2. **Lead with "why"** (not "what" or "how much")
3. **Relationship metrics first** (Trust Equation primary)
4. **Remove financial prescriptions** (methodology only, no dollar amounts)
5. **Remove ML/automation** (manual processes acceptable)
6. **Simple visuals only** (ASCII boxes, tables - no complex dashboards)
7. **Practical examples** (financial services scenarios)

---

## Migration Execution Plan

### Phase 1: Core Framework (Week 1-2)
**Status:** IN PROGRESS

- [ ] Create `/core/` directory structure ✅
- [ ] Build core/02_Service_Catalog.md (FOR-237)
- [ ] Build core/01_Program_Guide.md (consolidate BISOPRO-01 + WP1 11-steps)
- [ ] Build core/03_Organizational_Design.md (consolidate BISOPRO-03 + 07)
- [ ] Build core/04_Role_Definitions.md (simplify BISOPRO-08)
- [ ] Build core/05_Stakeholder_Engagement.md (simplify BISOPRO-04)
- [ ] Build core/06_Success_Measurement.md (restructure BISOPRO-05)
- [ ] Build core/07_Common_Challenges.md (simplify BISOPRO-21)

### Phase 2: Template Extraction (Week 2-3)
- [ ] Extract templates/02_Trust_Equation_Scorecard.md (from BISOPRO-05)
- [ ] Extract templates/03_Monthly_Pulse_Survey.md (from BISOPRO-05)
- [ ] Extract templates/04_Risk_Assessment_Worksheet.md (from BISOPRO-12)
- [ ] Extract templates/05_Business_Case_Builder.md (from BISOPRO-11)
- [ ] Extract templates/06_Consultation_Request_Form.md (from BISOPRO-17)

### Phase 3: Maturity Model (Week 3)
- [ ] Create maturity/maturity_model.md (full 4-level framework)
- [ ] Create maturity/level_1_quick_start.md (weeks 1-12 guidance)
- [ ] Create maturity/level_2_expanding.md (months 4-9 guidance)
- [ ] Create maturity/level_3_optimizing.md (months 10-18 guidance)
- [ ] Create maturity/level_4_excellence.md (18+ months guidance)

### Phase 4: Advanced Reorganization (Week 4)
- [ ] Create `/advanced/` theme directories
- [ ] Move BISOPRO docs from `/deliverables/` to `/advanced/`
- [ ] Organize by theme (alignment, strategy, operations, people, governance)
- [ ] Update all internal cross-references
- [ ] Add maturity level indicators to each doc

### Phase 5: Navigation & Documentation (Week 4-5)
- [ ] Rewrite README.md (start with /core/)
- [ ] Update INDEX.md (new structure navigation)
- [ ] Update CLAUDE.md (new conventions and standards)
- [ ] Create MIGRATION_NOTES.md (what changed and why)
- [ ] Update BISO_Master_Implementation_Tracker.csv

### Phase 6: Cleanup (Week 5)
- [ ] Archive or remove `/deliverables/` directory
- [ ] Consolidate `/guides/` into `/guides_v2/`
- [ ] Update all Linear issues with new paths
- [ ] Create release notes for v0.2
- [ ] Tag v0.2-beta for testing

---

## Success Criteria for V0.2

### Practitioner Experience
- ✅ Can start BISO program in Week 1 with `/core/` only (4-5 hours)
- ✅ Has clear growth path via `/maturity/` model
- ✅ Can find templates quickly in `/templates/`
- ✅ Can reference depth when needed in `/advanced/`
- ✅ Knows which docs to use at which stage

### Framework Quality
- ✅ 7 core documents are standalone and actionable
- ✅ Templates are immediately usable (no customization required)
- ✅ Maturity model shows clear progression
- ✅ Advanced docs organized logically by theme
- ✅ Navigation is intuitive (README → core → templates → maturity → advanced)

### Alignment with Learnings
- ✅ Relationship metrics primary (not financial ROI)
- ✅ Simple entry point (not overwhelming)
- ✅ Trust Equation prominent (not buried)
- ✅ Whitepaper-aligned (4 service categories, 11-step approach, Trust Equation)
- ✅ Practitioner-tested (can use Monday morning)

---

## Key Principles

### What We're Keeping
- ✅ All 30 BISOPRO documents (moved to `/advanced/`)
- ✅ Comprehensive depth and rigor
- ✅ Cross-referencing (but simplified)
- ✅ Visual frameworks (but simpler)
- ✅ Structural prescriptiveness (alignment models, reporting structures)

### What We're Changing
- ❌ No more "read all 30 docs" requirement
- ❌ No more financial prescriptions in core
- ❌ No more ML/automation as baseline
- ❌ No more 500+ cross-references
- ❌ No more equal treatment of all docs

### What We're Adding
- ✅ Clear entry point (`/core/`)
- ✅ Progressive complexity (`/maturity/`)
- ✅ Usable templates (`/templates/`)
- ✅ Theme-based organization (`/advanced/`)
- ✅ Practical maturity guidance

---

## Questions Resolved

**Q: Is this just adding content alongside old framework?**
A: NO. This is architectural transformation. `/core/` replaces "start with BISOPRO-01."

**Q: What happens to old deliverables?**
A: Moved to `/advanced/`, organized by theme, used at maturity Level 2+.

**Q: Are we deleting anything?**
A: NO. Everything preserved in `/advanced/`. Just reorganized and re-prioritized.

**Q: Can mature programs still use comprehensive framework?**
A: YES. Level 3-4 organizations use full `/advanced/` framework. Entry point is different.

**Q: What about Linear issues referencing old paths?**
A: Will update issue descriptions with new paths during migration.

---

## Next Immediate Actions

1. ✅ Create directory structure
2. 🏗️ Build core/02_Service_Catalog.md (proper design)
3. 🏗️ Create maturity/maturity_model.md (framework)
4. 🏗️ Continue building core/ documents
5. 🏗️ Extract templates systematically
6. 🏗️ Move and organize advanced/
7. 🏗️ Update all navigation

---

**Status:** Architecture phase complete. Ready to build.
**Next:** Build core/02_Service_Catalog.md with proper design.
