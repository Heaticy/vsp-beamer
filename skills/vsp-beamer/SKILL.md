---
name: vsp-beamer
description: VSP-Beamer skill bundle for planning, generating, migrating, rendering, auditing, polishing, resuming, and exporting XeLaTeX Beamer slide decks. Use whenever the user asks for VSP-style slides, LaTeX Beamer课件/汇报/答辩, changes this repository's themes/templates/practices, migrates VSP-Marp or other source material to Beamer, or invokes vsp-beamer:* / vb:* commands. Route the request to plan, start, resume, generate, render, audit, theme, assets, export, or polish.
---

# VSP-Beamer

This is the routing entry for the complete VSP-Beamer workflow.

When routing to a capability, read `skills/<capability>/SKILL.md` relative to this file and execute it. Do not assume the host automatically discovers nested skills; all capabilities must remain available through this root skill.

In a full checkout, locate the repository root from `SKILL_DIR` before using `Makefile`, `themes/`, `templates/`, `practice/`, `shared-assets/`, or `scripts/`.

## Commands

| Command | Alias | Capability |
| --- | --- | --- |
| `vsp-beamer:plan` | `vb:plan` | Plan audience, theme, structure, page count, assets, and validation |
| `vsp-beamer:start` | `vb:start` | Run the complete workflow |
| `vsp-beamer:resume` | `vb:resume` | Continue from an existing plan, TeX, PDF, or audit result |
| `vsp-beamer:generate` | `vb:generate` | Create or migrate editable Beamer TeX |
| `vsp-beamer:render` | `vb:render` | Render one or all decks through Make and XeLaTeX |
| `vsp-beamer:audit` | `vb:audit` | Audit logs, PDF geometry, raster pages, and visual quality |
| `vsp-beamer:theme` | `vb:theme` | Select, explain, apply, or modify a theme |
| `vsp-beamer:assets` | `vb:assets` | Inventory local assets, paths, dimensions, and missing files |
| `vsp-beamer:export` | `vb:export` | Prepare final TeX/PDF deliverables and repository output |
| `vsp-beamer:polish` | `vb:polish` | Repair issues from feedback, screenshots, or audit reports |

Report unknown `vsp-beamer:*` or `vb:*` commands instead of guessing.

## Automatic routing

- Only discuss structure or parameters: `plan`
- Create a complete deck end to end: `start`
- Continue interrupted work: `resume`
- Produce or migrate TeX without completing the pipeline: `generate`
- Compile or diagnose compilation: `render`
- Review quality, overflow, overlap, fonts, or backgrounds: `audit`
- Choose or change theme/style/typography: `theme`
- Resolve images, fonts, paths, or missing resources: `assets`
- Prepare final files or repository release: `export`
- Apply review feedback or fix known defects: `polish`

## Complete workflow

`plan → assets → generate → render → audit → polish (when needed) → export`

If the user asks for full execution, continue through export unless blocked. If they ask only for one stage, stop after that stage.

## Repository invariants

- Support Linux only; use Ubuntu/Debian as the validated release baseline.
- Use GNU Make, latexmk, and XeLaTeX.
- Keep Latin Modern for Western text and system Noto CJK SC for Chinese text.
- Keep reusable layout and typography in `themes/beamerthemeVSP.sty`; keep `.tex` semantic and concise.
- Use local repository-relative assets; do not add remote image/font dependencies.
- Do not introduce Node.js, npm, TypeScript, Marp directives, HTML wrappers, or CSS.
- Preserve unrelated user changes and isolate theme-specific behavior with existing option conditionals.
- Put generated PDFs under `build/`; do not recreate `dist/`.
- After shared theme, font, Makefile, asset, or audit changes, run `make check`.

## Shared references

Read only what the task needs:

- [references/vsp-marp-parity.md](references/vsp-marp-parity.md): VSP-Marp design/workflow parity and semantic layout mapping
- [references/theme-system.md](references/theme-system.md): theme ownership, typography, and SHTU layering
- [references/pdf-review.md](references/pdf-review.md): automated and visual PDF review
- `references/templates/*.tex`: distributable snapshots of the seven standard templates

Prefer root `templates/` and `practice/` in a full checkout; use reference snapshots for Skill-only context.
