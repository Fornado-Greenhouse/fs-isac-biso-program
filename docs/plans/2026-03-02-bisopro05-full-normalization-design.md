# BISOPRO-05 Full Normalization Design

## Objective
Normalize `deliverables/BISOPRO-05_Success_Metrics.md` end-to-end to improve readability and rendering reliability without changing substantive guidance.

## Scope
- Entire document, including advanced appendix sections.
- No content deletion for policy/measurement substance.
- Presentation-only modernization unless a layout block is unreadable and requires structural reflow.

## Style Contract

### Status Notation
- Use `G` for green status.
- Use `Y` for yellow status.
- Use `R` for red status.
- Remove emoji status indicators (`🟢`, `🟡`, `🔴`, checkmarks, Xs, decorative icons).

### Directional Notation
- Up trend: `^`
- Down trend: `v`
- Right/forward: `->`
- Left/back: `<-`
- Bidirectional: `<->`
- Flat/no change: `--`

### Arrows
- Replace unicode arrows and symbols with ASCII equivalents.
- Preferred mapping:
  - `→` => `->`
  - `←` => `<-`
  - `↔` => `<->`
  - `↑`/`⬆️` => `^`
  - `↓`/`⬇️` => `v`
  - `➡️` => `->`

### Tables and Layout
- Convert box-drawing ASCII table blocks to standard Markdown tables.
- Preserve existing table data and headings where possible.
- Ensure blank line before each Markdown table for reliable Jekyll/Kramdown parsing.
- Preserve simple fenced code blocks only where tabular conversion would lose meaning.

## Transformation Strategy

### Phase A: Global token cleanup
- Remove decorative emoji.
- Normalize directional tokens and status syntax.
- Preserve semantic labels and metric definitions.

### Phase B: Table reflow
- Convert ASCII panel/dashboards and templates into Markdown sections plus tables.
- Prioritize end-of-document sections where visual density is highest.

### Phase C: Rendering hardening
- Add spacing fixes around headings, tables, and fences.
- Run parse-risk checks for table blocks.

### Phase D: Verification
- Forbidden token sweep (emoji/unicode arrows).
- Manual readability sweep near end sections (dashboards/report templates/RACI/calendar).
- Publish and verify live page.

## Risks and Mitigations
- Risk: Meaning drift during large layout conversion.
  - Mitigation: Keep original metric names/targets/definitions unchanged.
- Risk: Missed emoji in dense appendix blocks.
  - Mitigation: Regex-based exhaustive sweep.
- Risk: Broken internal anchor references after heading edits.
  - Mitigation: Keep heading text stable where links exist; recheck references.

## Deliverable
A single normalized `BISOPRO-05` document with:
- ASCII-only directional/status notation
- Markdown-native tables throughout
- no decorative emoji
- improved readability in late sections
- render-safe spacing for GitHub Pages/Jekyll
