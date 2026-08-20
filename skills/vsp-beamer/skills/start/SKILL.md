---
name: vsp-beamer-start
description: Execute the complete VSP-Beamer production workflow from source material or an approved plan. Use when the user says start, begin, make the full deck, execute the slide plan, or invokes vsp-beamer:start / vb:start.
---

# VSP-Beamer Start

Orchestrate the complete pipeline; use the other capabilities for their specialized stages.

## Preflight

1. If structure, audience, theme, or deliverables are unclear, execute `../plan/SKILL.md` first.
2. Confirm source paths and repository root.
3. Check `git status` and preserve unrelated changes.
4. Record expected editable TeX and final PDF paths.

## Pipeline

1. **Assets**: execute `../assets/SKILL.md` to inventory images/fonts and resolve local paths.
2. **Generate**: execute `../generate/SKILL.md` to create or migrate semantic TeX.
3. **Render**: execute `../render/SKILL.md` through the repository Makefile.
4. **Audit**: execute `../audit/SKILL.md`, including every-page raster review.
5. **Polish**: if any Major issue or user-visible defect remains, execute `../polish/SKILL.md`, rerender, and re-audit.
6. **Export**: execute `../export/SKILL.md` to verify final deliverables.

## Progress record

Track:

- source inputs and chosen theme
- current stage
- files created or changed
- TeX and PDF paths
- audit evidence and remaining issues
- next stage

This record allows `resume` to continue without restarting.
