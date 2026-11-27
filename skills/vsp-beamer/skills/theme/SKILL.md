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
- `presentation-blackred`: ShanghaiTech-branded presentation: black-red crimson gradient cover with crest, wordmark, motto and campus skyline; agenda section pages; progress footline; stat/step/meter components
- `presentation-bluepink`: presentation layout in blue and pink
- `presentation-lightred`: presentation layout in light coral red and dawn apricot
- `tutorial-tech-dark` / `tutorial-tech-light`: SI100B circuit look for technical teaching and talks: PCB-trace title band with the shared vector school logo, unified Latin Modern / Noto Sans CJK SC typography, rounded cards, stat/image cards; dark near-black-blue or light grey canvas

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
