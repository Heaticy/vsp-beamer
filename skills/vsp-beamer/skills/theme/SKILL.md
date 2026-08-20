---
name: vsp-beamer-theme
description: Select, explain, apply, or modify VSP-Beamer themes, palettes, typography, title/section/end pages, blocks, backgrounds, and footlines. Use when the user asks about theme, template, style, colors, fonts, SHTU branding, or invokes vsp-beamer:theme / vb:theme.
---

# VSP-Beamer Theme

Read `../../references/theme-system.md` before changing theme code.

## Theme selection

- `report-red`: default for paper, project, progress, and formal technical reports
- `report-nailong`: light, playful report
- `tutorial-red`: general teaching and recitation
- `tutorial-red-shtu`: ShanghaiTech teaching with branded background
- `tutorial-purple`: alternate teaching palette
- `tutorial-nailong`: light, playful teaching or group meeting

## Process

1. Select a theme from audience, scenario, density, and branding needs.
2. Read the matching root template and thin theme entry.
3. Put reusable changes in `themes/beamerthemeVSP.sty`; keep entries thin and documents semantic.
4. Keep the fixed typography scale centralized in named Beamer fonts.
5. Isolate SHTU behavior with `\ifvsp@shtu`; preserve its right-top name, left-bottom skyline, and right-bottom motto.
6. Preserve non-target theme behavior.
7. Render a representative deck, rasterize all pages, then run `make check` for shared changes.

## Output

Report theme choice/rationale or exact theme changes, affected pages/themes, visual evidence, and full check result.
