# Repository Guidelines

## Project Structure & Module Organization
This repository is a documentation-first Jekyll site for the FS-ISAC BISO framework.
- `deliverables/`: Core BISOPRO documents (`BISOPRO-01_...md` through `BISOPRO-25_...md`).
- `guides/`: Implementation guides (`BISO_GUIDE-01_...md` to `BISO_GUIDE-05_...md`).
- `core/`, `maturity/`, `templates/`, `prompts/`: Supporting framework content.
- `_includes/` and `_config.yml`: Just the Docs/Jekyll site configuration.
- `.github/workflows/pages.yml`: Canonical CI build/deploy workflow for GitHub Pages.
- `docs/plans/`: Internal planning notes (excluded from site build).

## Build, Test, and Development Commands
Use Ruby/Bundler for local work:
- `bundle install`: Install Jekyll and theme dependencies from `Gemfile`.
- `bundle exec jekyll serve --livereload`: Run the site locally for authoring/review.
- `bundle exec jekyll build`: Produce a production-style site build in `_site/`.
- If system Ruby is too old for current gems, use Homebrew Ruby 3.3 for this repo only:
  - `export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"`
  - `BUNDLE_USER_HOME=.bundle_home BUNDLE_PATH=vendor/bundle bundle install`
  - `BUNDLE_USER_HOME=.bundle_home BUNDLE_PATH=vendor/bundle bundle exec jekyll build`

CI uses:
- `bundle exec jekyll build --baseurl "${BASE_PATH}"` (see workflow), so verify local changes with `jekyll build` before opening a PR.

## Coding Style & Naming Conventions
- Use Markdown with YAML front matter (`title`, `description`, `parent`, `nav_order`) for navigable docs.
- Keep standard Markdown tables (do not convert to ASCII art tables).
- Prefer relative links between documents (for example `./BISOPRO-11_Business_Case_ROI.md`).
- File naming patterns:
  - Deliverables: `BISOPRO-##_Descriptive_Name.md`
  - Guides: `BISO_GUIDE-##_Descriptive_Name.md`
- Avoid document version/date/owner metadata in front matter or body content.

## Testing Guidelines
There is no code test suite in this repo; validation is content and build based:
- Run `bundle exec jekyll build` before committing.
- Manually spot-check navigation, links, and callouts in `bundle exec jekyll serve`.
- For major content edits, verify cross-references and phase timeline consistency.

## Commit & Pull Request Guidelines
- Follow existing commit style: imperative summary (`Fix ...`, `Add ...`) or Linear-linked format (`Completes FOR-244: ...`).
- Work on feature branches and open PRs to `main` (no direct pushes).
- PRs should include:
  - Clear scope summary and affected paths (for example `deliverables/`, `guides/`).
  - Linked issue(s) (Linear/GitHub) when applicable.
  - Screenshots only when visual rendering/layout changed.
