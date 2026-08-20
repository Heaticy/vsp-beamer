---
name: vsp-beamer-assets
description: Inventory, validate, and organize VSP-Beamer images, fonts, logos, backgrounds, formulas, and file paths. Use when the user mentions assets, missing images, bad paths, remote resources, image dimensions, distortion, fonts, or invokes vsp-beamer:assets / vb:assets.
---

# VSP-Beamer Assets

Ensure every public deck builds offline and every figure is laid out from real dimensions.

## Process

1. Scan target TeX for `\includegraphics`, font paths, and other file references.
2. Resolve each path relative to the repository root and source document.
3. Read image width, height, format, and aspect ratio with `identify` or `file`.
4. Flag missing, duplicate, corrupt, unexpectedly large, or remote assets.
5. Place reusable assets in `shared-assets/`; place one-practice assets in that practice's `img/`.
6. Choose layout guidance from aspect ratio and information density:
   - wide/dense: full-width or rows layout
   - portrait: narrow image column
   - comparison: balanced columns
   - dense labels: larger area or dedicated page
7. Preserve image ratio with `keepaspectratio`.
8. Confirm the Noto CJK SC system families exist and keep Latin Modern from TeX Live.

A URL shown as literal code in teaching content is not a build dependency; distinguish it from a remote `\includegraphics` or font source.

## Output

Return a resource table with path, ownership, dimensions/aspect ratio, status, recommended layout, and any required fixes. The next capability is usually `generate` or `render`.
