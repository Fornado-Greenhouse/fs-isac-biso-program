# GitHub Pages Implementation Plan

## Goal
Deploy the FS-ISAC BISO Program repository as a searchable, indexed documentation site using GitHub Pages with the Just the Docs theme, preserving all existing content structure and 1,500+ cross-reference links.

## Decisions Made
- **Site scope**: Whole repo deployed from `main` branch root (not a `/docs` subfolder)
- **Theme**: Just the Docs (sidebar navigation, search, table of contents)
- **Front matter**: YAML front matter added to all 46 markdown files
- **Link handling**: `jekyll-relative-links` plugin + `permalink: pretty`
- **SEO**: Per-page titles/descriptions, auto-generated sitemap, Search Console verification
- **File reorg**: CSV → `/templates/`, QUERY.yaml → `/prompts/`, delete internal artifacts
- **Exclusions**: CLAUDE.md excluded from site build, internal docs deleted

## Implementation Steps

### Step 1: File Reorganization
Move and delete files to clean up the repo structure before adding Pages config.

**Actions:**
- Create `/prompts/` directory
- Move `BISO_Master_Implementation_Tracker.csv` → `templates/BISO_Master_Implementation_Tracker.csv`
- Move `QUERY.yaml` → `prompts/BISO_Policy_Analysis_Prompt.yaml`
- Delete `LINEAR_CLEANUP_SUMMARY.md`
- Delete `MIGRATION_PLAN_V02.md`

**Verification:** `git status` shows expected moves/deletes, no broken references to moved files.

### Step 2: Add Jekyll Configuration Files
Create the core config that turns the repo into a Just the Docs site.

**Files to create:**

`_config.yml` (repo root):
```yaml
title: "FS-ISAC BISO Program"
description: "Complete implementation framework for Business Information Security Officers in financial services"
url: "https://fornado-greenhouse.github.io"
baseurl: "/fs-isac-biso-program"

theme: just-the-docs

permalink: pretty

color_scheme: light

search_enabled: true
search.heading_level: 3

nav_sort: case_insensitive
back_to_top: true
back_to_top_text: "Back to top"

heading_anchors: true

plugins:
  - jekyll-relative-links
  - jekyll-sitemap

relative_links:
  enabled: true
  collections: true

exclude:
  - CLAUDE.md
  - Gemfile.lock
  - LICENSE
  - .gitignore
  - docs/plans/
  - node_modules/
  - vendor/
```

`Gemfile` (repo root):
```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.3"
gem "just-the-docs", "~> 0.10"
gem "jekyll-relative-links"
gem "jekyll-sitemap"
```

**Verification:** Files exist and YAML/Ruby syntax is valid.

### Step 3: Add GitHub Actions Workflow
Create the build pipeline since Just the Docs requires Actions (not the basic Pages build).

`.github/workflows/pages.yml`:
```yaml
name: Deploy GitHub Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.3'
          bundler-cache: true
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Build with Jekyll
        run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

**Verification:** Workflow file passes YAML lint.

### Step 4: Add Search Console Verification
Create the custom head include for Google ownership verification.

`_includes/head_custom.html`:
```html
<meta name="google-site-verification" content="USER_PROVIDES_CODE" />
```

**Verification:** Tag present in rendered HTML `<head>`.

### Step 5: Create Section Parent/Index Pages
Create navigation parent pages that organize the sidebar hierarchy.

**Phase parent pages (repo root):**
- `phase-1-foundation.md` — has_children: true, nav_order: 2
- `phase-2-structure.md` — has_children: true, nav_order: 3
- `phase-3-strategic-value.md` — has_children: true, nav_order: 4
- `phase-4-continuous-improvement.md` — has_children: true, nav_order: 5

**Section index pages:**
- `guides/index.md` — has_children: true, nav_order: 6
- `core/index.md` — has_children: true, nav_order: 7
- `templates/index.md` — has_children: true, nav_order: 8
- `maturity/index.md` — has_children: true, nav_order: 9
- `prompts/index.md` — has_children: true, nav_order: 10

Each is ~10 lines with title, description, `has_children: true`, and a brief intro paragraph.

**Verification:** All parent pages exist with correct front matter.

### Step 6: Add YAML Front Matter to All Documents
Add front matter to all 46 existing markdown files. This is the bulk of the work.

**Pattern for deliverables (example BISOPRO-01):**
```yaml
---
title: "BISO Program Charter"
description: "Program authorization and governance framework establishing mission, scope, and authority for BISO implementation"
parent: "Phase 1: Foundation"
nav_order: 1
---
```

**Pattern for guides (example BISO_GUIDE-01):**
```yaml
---
title: "Quick Reference Guide"
description: "Concise reference for BISO program key concepts, processes, and decision frameworks"
parent: "Implementation Guides"
nav_order: 1
---
```

**Front matter mapping for all 46 documents:**

| File | title | parent | nav_order |
|------|-------|--------|-----------|
| README.md | FS-ISAC BISO Program | (none - homepage) | 1 |
| INDEX.md | Cross-Reference Index | (none - top level) | 1.5 |
| **Phase 1 Deliverables** | | Phase 1: Foundation | |
| BISOPRO-01_Charter.md | BISO Program Charter | Phase 1: Foundation | 1 |
| BISOPRO-02_Problem_Statement.md | Problem Statement | Phase 1: Foundation | 2 |
| BISOPRO-03_Alignment_Model_Analysis.md | Alignment Model Analysis | Phase 1: Foundation | 3 |
| BISOPRO-04_Stakeholder_Engagement_Protocols.md | Stakeholder Engagement Protocols | Phase 1: Foundation | 4 |
| BISOPRO-05_Success_Metrics.md | Success Metrics Framework | Phase 1: Foundation | 5 |
| **Phase 2 Deliverables** | | Phase 2: Structure | |
| BISOPRO-06_Authority_Framework.md | Authority Framework | Phase 2: Structure | 1 |
| BISOPRO-07_Reporting_Structure.md | Reporting Structure | Phase 2: Structure | 2 |
| BISOPRO-08_Job_Descriptions.md | Job Descriptions | Phase 2: Structure | 3 |
| BISOPRO-09_Key_Processes_Implementation.md | Key Processes Implementation | Phase 2: Structure | 4 |
| BISOPRO-10_Support_Structure.md | Support Structure | Phase 2: Structure | 5 |
| **Phase 3 Deliverables** | | Phase 3: Strategic Value | |
| BISOPRO-11_Business_Case_ROI.md | Business Case & ROI Analysis | Phase 3: Strategic Value | 1 |
| BISOPRO-12_Risk_Assessment_Methodology.md | Risk Assessment Methodology | Phase 3: Strategic Value | 2 |
| BISOPRO-13_Executive_Briefing_Framework.md | Executive Briefing Framework | Phase 3: Strategic Value | 3 |
| BISOPRO-14_Executive_Sponsorship_Plan.md | Executive Sponsorship Plan | Phase 3: Strategic Value | 4 |
| BISOPRO-15_Strategic_Alignment.md | Strategic Alignment | Phase 3: Strategic Value | 5 |
| BISOPRO-16_Competitive_Analysis.md | Competitive Analysis | Phase 3: Strategic Value | 6 |
| BISOPRO-17_Security_Consultation_Framework.md | Security Consultation Framework | Phase 3: Strategic Value | 7 |
| BISOPRO-18_Independence_Framework.md | Independence Framework | Phase 3: Strategic Value | 8 |
| BISOPRO-19_Training_Development_Programs.md | Training & Development Programs | Phase 3: Strategic Value | 9 |
| BISOPRO-20_Professional_Development_Framework.md | Professional Development Framework | Phase 3: Strategic Value | 10 |
| **Phase 4 Deliverables** | | Phase 4: Continuous Improvement | |
| BISOPRO-21_Challenge_Mitigation_Framework.md | Challenge Mitigation Framework | Phase 4: Continuous Improvement | 1 |
| BISOPRO-22_Business_Evolution_Framework.md | Business Evolution Framework | Phase 4: Continuous Improvement | 2 |
| BISOPRO-23_Core_Competencies_Development.md | Core Competencies Development | Phase 4: Continuous Improvement | 3 |
| BISOPRO-24_Recruitment_Strategy.md | Recruitment Strategy | Phase 4: Continuous Improvement | 4 |
| BISOPRO-25_Escalation_Decision_Framework.md | Escalation Decision Framework | Phase 4: Continuous Improvement | 5 |
| **Implementation Guides** | | Implementation Guides | |
| BISO_GUIDE-01_Quick_Reference.md | Quick Reference | Implementation Guides | 1 |
| BISO_GUIDE-02_Implementation.md | Implementation Guide | Implementation Guides | 2 |
| BISO_GUIDE-03_Roadmap.md | Roadmap | Implementation Guides | 3 |
| BISO_GUIDE-04_Customization.md | Customization Guide | Implementation Guides | 4 |
| BISO_GUIDE-05_Technology_Strategy.md | Technology Strategy | Implementation Guides | 5 |
| **Core Documents** | | Core Documents | |
| 01_Program_Guide.md | Program Guide | Core Documents | 1 |
| 02_Service_Catalog.md | Service Catalog | Core Documents | 2 |
| 03_Organizational_Design.md | Organizational Design | Core Documents | 3 |
| 04_Role_Definitions.md | Role Definitions | Core Documents | 4 |
| 05_Stakeholder_Engagement.md | Stakeholder Engagement | Core Documents | 5 |
| 06_Success_Measurement.md | Success Measurement | Core Documents | 6 |
| 07_Common_Challenges.md | Common Challenges | Core Documents | 7 |
| **Templates** | | Templates | |
| Stakeholder_Mapping_Template.md | Stakeholder Mapping Template | Templates | 1 |
| Trust_Equation_Scorecard_Template.md | Trust Equation Scorecard | Templates | 2 |
| Monthly_Pulse_Survey_Template.md | Monthly Pulse Survey | Templates | 3 |
| BISO_Master_Implementation_Tracker.csv | Implementation Tracker | Templates | 4 |
| **Maturity** | | Maturity Model | |
| maturity_model.md | Maturity Model & Assessment | Maturity Model | 1 |
| **Prompts** | | Prompts | |
| BISO_Policy_Analysis_Prompt.yaml | Policy Analysis Prompt | Prompts | 1 |

**Description writing:** Each document gets a unique 120-160 character description summarizing its purpose with searchable terms (BISO, security, financial services, risk, etc.).

**Verification:** All files have valid YAML front matter. No syntax errors. `parent:` values match parent page titles exactly.

### Step 7: Update .gitignore
Remove the `docs` entry if present (since we're not using a /docs source folder and the docs/plans directory should be tracked).

**Verification:** `docs/plans/` is trackable by git.

### Step 8: Enable GitHub Pages in Repository Settings
This must be done manually in the GitHub UI after the first push:

1. Go to Settings → Pages
2. Set Source to **GitHub Actions** (not "Deploy from a branch")
3. The workflow handles everything from there

**Verification:** First Actions run completes successfully, site is live.

### Step 9: Post-Deploy Verification
After the site is live at `https://fornado-greenhouse.github.io/fs-isac-biso-program/`:

1. Verify homepage renders correctly
2. Verify sidebar navigation shows all sections and documents
3. Verify search works
4. Run a link checker across the site to catch any broken cross-references
5. Verify Google Search Console meta tag is present in page source
6. Submit sitemap URL to Search Console: `https://fornado-greenhouse.github.io/fs-isac-biso-program/sitemap.xml`

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| Cross-reference links break | `jekyll-relative-links` plugin handles `.md` → HTML conversion; post-deploy link check catches any misses |
| Large documents render slowly | Just the Docs handles this fine; table of contents auto-generated per page |
| GitHub Actions build fails | Test locally with `bundle exec jekyll serve` before pushing |
| Front matter YAML syntax errors | Validate each file's front matter before committing |

## Execution Strategy
This plan has high parallelism potential. Steps 2-4 (config files) are independent of Step 6 (front matter). File reorg (Step 1) should go first. The front matter work (Step 6) is the bulk — 46 files — but each file is independent and can be done in parallel by multiple agents.

Recommended execution order:
1. Step 1 (file reorg) — sequential, do first
2. Steps 2, 3, 4, 5 in parallel — config + workflow + verification tag + parent pages
3. Step 6 in parallel batches — front matter for all 46 docs
4. Step 7 (.gitignore update)
5. Commit, push, create PR
6. Steps 8-9 after merge — manual Pages enablement + verification
