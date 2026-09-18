# Theme System

Read this reference when changing `themes/beamerthemeVSP.sty` or a named theme entry.

## Ownership

- `themes/beamerthemeVSP.sty`: shared colors, fonts, page templates, blocks, lists, code, and helper commands.
- `themes/beamertheme<name>.sty`: thin option entry only.
- `templates/*.tex`: concise editable examples; no theme implementation.
- `practice/**/*.tex`: content-heavy examples with local assets.

## Fixed typography

The shared font scale is mapped from the VSP-Marp 1280x720 design tokens and should remain centralized:

| Role | Beamer size / leading |
| --- | --- |
| Body | 8.86 / 12.85 pt (`25px`) |
| Display / cover / end title | 19.49 / 23.38 pt (`55px`) |
| Subtitle | 14.88 / 17.85 pt (`42px`) |
| Heading / frame title | 13.47 / 16.16 pt (`38px`) |
| Subheading | 10.63 / 12.76 pt (`30px`) |
| Section transition | 35.43 / 42.52 pt (`100px`, Marp `section.trans h2` = `4rem`) |
| Footer | 7.8 / 9.45 pt (`22px`) |
| Page number | 4.25 / 5.1 pt (`12px`) |
| Code | 7.09 / 8.51 pt (`20px`) |

- Keep body, cover, frame-title, section, footer, page-number, and code sizes on the named VSP-Marp preset commands in `beamerthemeVSP.sty`; do not add local `\small` or arbitrary `\fontsize` patches.
- Marp emphasis parity: `\textbf` is renewed globally to bold in `VSPAccent` (Marp `strong`), while `\alert` colors only (`alerted text` is `VSPAccent`). Beamer's own titles, labels, and block headers use font templates, not `\textbf`, so they are unaffected.

## Section transition pages

Match VSP-Marp's `trans` contract:

- Red, purple, tutorial, and SHTU transitions use a full `VSPPrimary` canvas with centered white `section title` text.
- SHTU transition pages deliberately suppress the ShanghaiTech master background, just as Marp excludes `.trans` from that background selector.
- Nailong transitions use `shared-assets/nailong/nailong-bg.png` over white at 45% opacity, with centered white text and a restrained dark shadow.
- Do not draw an underline or decorative horizontal rule below the centered section title.
- Keep the title at the fixed 22.68/27.22pt `section` preset, which maps Marp's 64px heading through the 1280px-to-453.543pt page scale.

## Emphasis callouts

Match Marp's `bq-*` structure with a colored title strip and a shared light body, not a plain LaTeX quote or left rule.

| Marp class | Beamer environment | Header color |
| --- | --- | --- |
| `bq` | `vspquote` | preset-aware `VSPCalloutDefault` |
| `bq-blue` | `vspquoteblue` | `VSPCalloutBlue` |
| `bq-red` | `vspquotered` | `VSPCalloutRed` |
| `bq-green` | `vspquotegreen` | `VSPCalloutGreen` |
| `bq-purple` | `vspquotepurple` | `VSPCalloutPurple` |
| `bq-black` | `vspquoteblack` | `VSPCalloutBlack` |
| `bq-yellow` | `vspquoteyellow` | `VSPCalloutYellow` |

The default header follows the exported Marp preset: tutorial red/SHTU/purple use `VSPCalloutRed`, report-red and Nailong use their current `VSPPrimary`. Variant environments always use the explicitly named color.

Pass the callout title as the required environment argument, then place the body inside:

```tex
\begin{vspquote}{强调引用}
适合突出课堂提示、注意事项或阶段性结论。
\end{vspquote}
```

Do not use the plain `quote` environment for an emphasis callout. On a callout-only example slide, use a top-aligned frame such as `\begin{frame}[t]{...}` so the box occupies Marp's content start rather than Beamer's default vertical center.

## Cover and end pages

Set presenter metadata through the shared speaker API:

```tex
\VSPsetspeaker{Presenter Name}{name@example.com}
\VSPsetspeaker[主讲人]{Presenter Name}{School or team}
```

The optional argument controls the pill label and defaults to `Speaker`. The command also updates Beamer's standard `\author` and `\institute` metadata, so existing PDF metadata and third-party Beamer tooling continue to work. Plain `\author`/`\institute` remain compatible, but use `\VSPsetspeaker` in VSP templates so the label, name, and detail line stay one component.

Fill the three-slot footline with the course metadata API:

```tex
\VSPsetupfootline{CS100 Recitation 1}{Fall 2026}{Presenter Name}
```

- The three slots are left course and session, middle term, right speaker; they default to empty, so decks opt in per use.
- On plain-canvas variants the footline renders the row on every page; the end frame repeats the same row at the bottom in both variants.
- On SHTU (or any variant whose background image occupies the bottom corners) the row would be occluded: the footline keeps the centered compact page number, and the course row renders only on the end frame.

- `tutorial-red-shtu` follows Marp `cover_e`: diagonal white/primary cover field, top-left ShanghaiTech mark, left content column, and bottom-right white university wordmark.
- Its `\VSPendframe` follows Marp `lastpage`: white canvas, primary horizontal band, centered white display title, and bottom metadata.
- Do not substitute the generic white-background title layout for SHTU.

## SHTU background layering

`tutorial-red-shtu` uses `shared-assets/backgrounds/shanghaitech-master.png` as a full-page background.

- Keep `normal text` and `frametitle` backgrounds transparent for SHTU.
- Keep non-SHTU themes on their existing opaque white canvas.
- SHTU cover/end pages intentionally own their Marp-matched full-page fills; ordinary body pages keep the transparent background layering.
- Stop frame-title rules before the right-top university name.
- Keep the footline away from the skyline and motto; a centered compact page number is appropriate, and the `\VSPsetupfootline` row belongs on the end frame only.
- Place body content in the large central white area instead of adding a second opaque panel.

## Change isolation

A shared edit must preserve all six theme entries. Put SHTU-specific behavior inside `\ifvsp@shtu`, Nailong-specific behavior inside `\ifvsp@nailong`, and report/tutorial differences inside the existing report conditional. After shared edits, run `make check`.
