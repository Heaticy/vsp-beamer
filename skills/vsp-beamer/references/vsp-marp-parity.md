# VSP-Marp Parity

Read this reference when converting a VSP-Marp deck, generating a new deck from source material, or aligning Beamer visuals with the VSP slide family.

## Shared design contract

VSP-Beamer should preserve the high-level VSP-Marp contract:

- the same six theme names and use cases
- cover, contents, section transitions, body pages, summary, and end page
- a stable display/heading/body/footer/code type hierarchy
- layout chosen from content shape and image aspect ratio
- 3-6 primary points per normal teaching slide; split dense material rather than shrinking globally
- rendered-page visual review after every meaningful layout change
- Major issues fixed before Minor issues and suggestions

Do not copy the implementation substrate. Beamer uses XeLaTeX, TikZ, Beamer templates, and local assets; it does not use Marp directives, HTML wrappers, CSS classes, Node.js, Playwright, or remote COS assets.

## Layout mapping

| VSP-Marp concept | VSP-Beamer equivalent |
| --- | --- |
| `cover_e` | title metadata plus `\VSPtitleframe` |
| `trans` / section divider | `\section` automatic page or `\VSPsectionframe` |
| `toc_a` / `toc_b` | a `frame` containing `\tableofcontents` |
| `fixedtitleA/B` | standard `\begin{frame}{...}` |
| `cols-2` | two `column` environments at `.48\textwidth` |
| `cols-2-64` | columns near `.58/.38\textwidth` |
| `cols-2-37` | columns near `.28/.68\textwidth` |
| `cols-3` | three columns near `.32\textwidth` |
| `rows-2-*` | text followed by a width-constrained image |
| `right-fill` | top-aligned columns with the important image or result in the wider column |
| `bq` / `bq-blue` / `bq-red` / `bq-green` / `bq-purple` / `bq-black` / `bq-yellow` | `vspquote` / `vspquoteblue` / `vspquotered` / `vspquotegreen` / `vspquotepurple` / `vspquoteblack` / `vspquoteyellow` |
| fenced code | `lstlisting` using the shared `vsp` code style (never raw `verbatim`) |
| `lastpage` | `\VSPendframe{...}` |

Treat these as semantic mappings, not mechanical translations. Adapt widths to actual content and keep the source TeX readable.

## Material planning

Before generating a content-heavy deck:

1. Identify audience, speaking context, title, expected duration, and deliverables from the prompt or source material.
2. Inspect headings, figures, formulas, tables, and code density.
3. Choose a theme from the same scenario mapping used by VSP-Marp.
4. Plan sections and an approximate page count.
5. Inventory every image and read its real dimensions; use aspect ratio and information density to choose columns, rows, or a full-width page.
6. Preserve formulas as TeX rather than screenshots.
7. Keep important figures large enough to read; give a dense figure its own explanation or display page.

## End-to-end loop

Use the VSP-Marp quality loop in Beamer form:

1. **Plan**: establish audience, theme, structure, assets, and validation.
2. **Assets**: resolve local paths, dimensions, missing files, and ownership (`shared-assets/` versus practice `img/`).
3. **Generate**: create concise semantic TeX using existing theme APIs.
4. **Render**: use the repository Makefile and XeLaTeX.
5. **Audit**: combine strict log/PDF checks with every-page raster review.
6. **Polish**: fix Major problems first, rerender, and re-audit affected pages.
7. **Deliver**: keep editable TeX and final PDFs under the documented repository structure.

If the user asks only for planning, stop after the plan. Otherwise continue through delivery unless blocked.
