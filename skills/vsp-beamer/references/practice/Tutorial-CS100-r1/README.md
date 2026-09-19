# Tutorial-CS100-r1

- Root source: `practice/Tutorial-CS100-r1/CS100-r1.tex`
- Theme: `tutorial-red-shtu` with `sectionpages`
- Scenario: full recitation/tutorial deck (CS100 Recitation 1, About Linux)
- Structure: cover, contents, four sections as separate `Section0N.tex` includes, end page
- Assets: `img/` screenshots and `code/` shell/C sources read via `\lstinputlisting`

Use this practice for long teaching decks driven by external code files (`\begin{Code}*[language]` + `\lstinputlisting`, no `[fragile]` needed), inline `\code{...}` next to CJK text, `\begin{Figure}*[caption]` two-column screenshots, `tblr` tables in `\begin{Table}[caption]`, and `vspquote` callouts. Multi-file decks: only the root file carries `\documentclass`.
