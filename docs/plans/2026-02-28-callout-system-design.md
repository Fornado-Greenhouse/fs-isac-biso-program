# Callout System Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add Just the Docs callout types to the BISO framework and apply them to BISOPRO-05 as the first document.

**Architecture:** 5 callout types configured in `_config.yml`, applied to new/modified content going forward. No retrofit of existing documents.

**Tech Stack:** Jekyll, Just the Docs theme callouts, kramdown

---

## Callout Types

| Type | Color | Title | Use For |
|------|-------|-------|---------|
| `.note` | Blue | Note | Context, cross-references, "see also" |
| `.tip` | Green | Tip | Practitioner guidance, customization advice |
| `.warning` | Red | Warning | Anti-patterns, pitfalls, scope creep |
| `.important` | Yellow | Important | Critical implementation constraints |
| `.maturity` | Purple | Mature Programs | Year 2+, advanced content, timing guidance |

## Usage Conventions

**Deliverables** — Use sparingly. Callouts for cross-reference notes, maturity boundaries, and critical anti-patterns. The content itself carries the weight.

**Guides** — Use more liberally. Callouts for customization tips, common pitfalls, implementation constraints. Guides are instructional, so more commentary is expected.

## Syntax Reference

```markdown
{: .note }
Single paragraph callout.

{: .warning }
> Multi-paragraph callout
>
> Second paragraph.

{: .maturity }
This section describes capabilities for Year 2+ programs.
Year 1 implementations should focus on manual processes.
```

## Scope

- New content only — no retrofitting existing 30 documents
- Apply to BISOPRO-05 (just restructured) and BISOPRO-11 (next sprint item)
- Future documents follow these conventions

---

## Implementation Tasks

### Task 1: Add callout configuration to _config.yml

**File:** `_config.yml`

Add callouts block:

```yaml
callouts:
  note:
    title: Note
    color: blue
  tip:
    title: Tip
    color: green
  warning:
    title: Warning
    color: red
  important:
    title: Important
    color: yellow
  maturity:
    title: Mature Programs
    color: purple
```

### Task 2: Apply callouts to BISOPRO-05

**File:** `deliverables/BISOPRO-05_Success_Metrics.md`

Convert these existing patterns to callouts:

1. Line 27 (italic aside about appendix) → `{: .maturity }` callout
2. Line 262 (blockquote note about implementation guide) → `{: .note }` callout
3. Line 303 (avoid duplicating financial models) → `{: .note }` callout
4. Line 908 (blockquote note about automation specs) → `{: .note }` callout
5. Appendix header (line 319, "For mature programs" italic) → `{: .maturity }` callout

### Task 3: Update CLAUDE.md with callout conventions

**File:** `CLAUDE.md`

Add a section documenting the callout types and usage conventions so future sessions use them consistently.

### Task 4: Commit, push, create PR
