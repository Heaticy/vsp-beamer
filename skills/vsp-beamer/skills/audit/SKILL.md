---
name: vsp-beamer-audit
description: Audit VSP-Beamer TeX/PDF output for compilation warnings, overflow, overlap, missing glyphs/images, distortion, typography, content density, theme consistency, and background visibility. Use whenever the user asks to review, audit, inspect, check layout or PDF quality, or invokes vsp-beamer:audit / vb:audit.
---

# VSP-Beamer Audit

Treat rendered pages as the visual source of truth. TeX structure and PDF boxes help locate issues but do not replace raster review.

Read `../../references/pdf-review.md` before auditing.

## Audit dimensions

| Dimension | Focus | Weight |
| --- | --- | --- |
| Build and fonts | XeLaTeX errors, warnings, missing glyphs, offline dependencies | 30% |
| Layout | bounds, overlap, image ratio, title/body/footer geometry | 35% |
| Visual | hierarchy, density, readability, whitespace, background/branding | 25% |
| Structure and theme | required pages, theme consistency, practice/template alignment | 10% |

## Severity

- **Major**: compile failure, missing image/glyph, overflow, overlap, distortion, unreadable figure/code, hidden required branding, or missing required slide structure.
- **Minor**: awkward line break, weak spacing, excessive density, suboptimal image area, or inconsistent style.
- **Suggestion**: optional improvement that does not block delivery.

## Process

1. Ensure a current PDF exists; otherwise execute `../render/SKILL.md`.
2. Run the focused audit:

```bash
./scripts/audit-pdf.sh build/path/to/deck.pdf
```

3. Scan the matching `.beamer-cache` log for strict diagnostics.
4. Rasterize every page with `pdftoppm` and build a contact sheet with `montage`.
5. Inspect every page; open ambiguous title, section, dense text/code, figure, and end pages at higher resolution.
6. For shared changes run `make check` and report repository-wide results.
7. If an automated finding looks false, inspect the page and structured PDF boxes before narrowing the rule.

## Report

Produce:

1. Summary
2. Strengths
3. Weaknesses grouped by Major/Minor/Suggestion with page numbers and evidence
4. Dimension score breakdown and overall decision
5. Prioritized repair roadmap
6. Confidence from 1-5

Never claim visual success without every-page raster evidence.
