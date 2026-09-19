---
name: vsp-beamer-generate
description: Generate or migrate editable VSP-Beamer XeLaTeX source from Markdown, PDF, papers, notes, existing slides, VSP-Marp, or other material. Use when the user asks to create TeX, migrate slides, restructure content, generate only the editable deck, or invokes vsp-beamer:generate / vb:generate.
---

# VSP-Beamer Generate

Create concise semantic `.tex`. Rendering belongs to the render capability unless the user requested the complete workflow.

## Inputs

- source material and approved plan, or enough context to derive one
- title metadata, audience, language, theme, and output path
- asset inventory from `../assets/SKILL.md` when figures are involved

## Process

1. Read the closest root template and relevant practice; in Skill-only context use `../../references/templates/<theme>.tex`.
2. Preserve the VSP structure: cover, contents, sections, body pages, summary when useful, and end page.
3. Use `\VSPtitleframe`, `\section`, `\VSPsectionframe` when needed, standard frames, and `\VSPendframe`.
4. Keep normal slides near 3-6 primary points; split dense material instead of reducing global font sizes.
5. Preserve formulas as TeX and use `[fragile]` for code frames (`lstlisting` blocks, never raw `verbatim`); use `\code{...}` for inline code, and `\begin{Code}*[language]` + `\lstinputlisting` for external code files (no `[fragile]` needed there). Center images/tables with `\begin{Figure}*[caption]` / `\begin{Table}[caption]` when a muted caption is wanted.
6. Choose columns/rows/full-width figures from actual image dimensions and information density.
7. Use `keepaspectratio`; never force both dimensions without an intentional crop.
8. Use local repository-relative assets only.
9. Do not copy Marp HTML classes or CSS. Follow `../../references/vsp-marp-parity.md` for semantic mappings.
10. Keep theme logic and typography out of the document source.

## Output

Report:

- generated or migrated `.tex` path
- selected theme and structure
- local asset list
- assumptions or content omitted due to missing inputs
- recommended next capability: `render`
