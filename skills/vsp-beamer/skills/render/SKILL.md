---
name: vsp-beamer-render
description: Compile VSP-Beamer TeX through GNU Make, latexmk, and XeLaTeX; produce PDFs under build/ and diagnose compilation failures. Use when the user asks to render, compile, build, export PDF, debug XeLaTeX, or invokes vsp-beamer:render / vb:render.
---

# VSP-Beamer Render

Use the repository Makefile rather than invoking XeLaTeX directly.

## Process

1. Confirm the input `.tex` exists.
2. Locate the repository root from this Skill path with Git when necessary; do not assume the caller's current directory.
3. Confirm required commands: `make`, `latexmk`, and `xelatex`.
4. Render one deck:

```bash
make render INPUT=<relative-input.tex>
```

The default output is `build/<relative-input-without-.tex>.pdf`.

5. Use `OUTPUT=<path>` only when the user requested a specific or temporary destination.
6. Build all decks with `make` when requested.
7. After shared theme/font/asset changes, use `make check` instead of a single render.

## Failure diagnosis

Check, in order:

- wrong working directory or missing `TEXINPUTS`
- missing theme entry or local asset
- incorrect case-sensitive path
- absent Noto CJK system font
- non-XeLaTeX engine
- TeX syntax and fragile-frame errors
- `Overfull`, missing glyph, font, or package warnings

Do not switch to pdfLaTeX or add remote dependencies to work around failures.

## Output

Report PDF path, page count, relevant log result, and the next capability (`audit` on success or the smallest actionable fix on failure).
