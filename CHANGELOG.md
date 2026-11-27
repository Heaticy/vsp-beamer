# Changelog

All notable changes to VSP-Beamer are documented in this file.

## v0.3.1 - 2026-11-27

- Unify callouts (`vspcallout` / `vspquote*`) and Beamer `block` environments across all themes into rounded cards with a soft-tinted header band and clean body area, removing vertical accent bars and cross-color gradients; tune base callout colors for legibility.
- Rename `tutorial-showcase`, `tutorial-showcase-sakura`, and `tutorial-showcase-coral` to `presentation-blackred`, `presentation-bluepink`, and `presentation-lightred` (shared layer `beamerthemepresentation.sty`), preserving the three palettes while refining covers, section/end pages, headers, `\VSPstat` number cards, `\VSPsteps`, and progress bars with all decorative lines removed.
- Rename `tech-dark` and `tech-light` to `tutorial-tech-dark` and `tutorial-tech-light` (shared layer `beamerthemetutorial-tech.sty`), keeping the circuit aesthetic while aligning top-right/cover logos to the shared vector `ShanghaiTech_Name*.pdf` assets (`7.2mm` in the title band), standardizing on Latin Modern + Noto Sans CJK SC typography, and fixing frame-title baseline alignment to match the `tutorial` family.

## v0.3.0 - 2026-11-22

- Add `tech-dark` and `tech-light`, a circuit style taken from the SI100B course slides: PCB-trace title band with the school logo, blue-violet rule, serif titles, rounded card callouts, `\VSPstat` number cards and the `VSPcard` image card. `beamerthemetech.sty` holds the layer; the two entries only pick the variant.
- Add `shared-assets/tech/`: cover, section and title-band circuit art for both variants, and the red and white school logos.

## v0.2.9 - 2026-11-22

- Add `tutorial-showcase-sakura` (sakura pink + moon-white blue) and `tutorial-showcase-coral` (coral red + dawn apricot): thin palette entries over the showcase layout, with matching templates.
- Showcase palette colors use `\providecolor`, so palette entries can override them.
- Showcase callouts, stat rules and chips use gradients (theme color to accent / to white); the frame-title rule is solid theme color; the cover gradient ends in the bright color.

## v0.2.8 - 2026-11-22

- Frame-title rule now uses the theme accent color (red for the red themes) instead of teal, matching `tutorial-showcase`.
- Remove teal everywhere: sub-bullets, shtu page-number frame and code secondary keywords use the accent color; example blocks use `VSPGreen`; amber/purple body inks lose their teal tint.

## v0.2.7 - 2026-11-11

- Rebrand `tutorial-showcase` as the ShanghaiTech showcase: crest red `#A40006` with a gold accent replaces the red/teal palette; the cover, section and end pages carry the white crest, wordmark, motto and campus skyline; body frames carry the crest beside the title and as a faint watermark; body text is sans-serif.
- Add `shared-assets/backgrounds/shanghaitech-master-white.pdf`, the white variant of the master background, used for the skyline and motto cut-outs.
- Remove the `/a0 gs` alpha reset from the ShanghaiTech PDFs so TikZ `opacity` applies to them; rendering at full opacity is unchanged.
- Installer and TDS package now ship the PDF assets (previously only PNGs, which left `tutorial-red-shtu` without its vector background after `make install`); `verify-install` checks the current asset names.

## v0.2.6 - 2026-11-11

- Add the `tutorial-showcase` theme: deep-red gradient cover with ribbon curves, section pages with hollow numerals and a highlighted agenda, frame titles with a section breadcrumb, and a footline with a progress bar and section dots.
- Showcase callouts and blocks drop fill, frame and shadow: a colored title sits on a hairline with a thickened left end.
- Showcase components `\VSPstat`, `\VSPmark`, `\VSPchip`, `\VSPsteps` and `\VSPmeter`, demonstrated in `templates/tutorial-showcase.tex`.
- Remove the GitHub Actions workflow; GitLab CI keeps running `make release`.

## v0.2.5 - 2026-10-14

- Rebuild the ShanghaiTech slide background with the official vector crest, aligned to the 8K master, instead of tracing its small raster emblem.
- Smooth the traced wordmark, skyline, and calligraphy while preserving sharp stroke junctions; keep the transparent, single-color path-only PDF below 180KB.
- Add the offline crest source and reproducible background rebuild script. Track PDF assets in Makefile prerequisites so background updates rebuild affected decks.

## v0.2.4 - 2026-10-14

- Vectorize the crest+wordmark lockup (`ShanghaiTech_Name.pdf` / `ShanghaiTech_Name_White.pdf`): official crest SVG composited with the wordmark traced from the 8K master; replaces the 1080×329 raster and fixes the invisible red-on-red wordmark on the SHTU title page.
- Vectorize the nailong full-page background (`nailong-bg.pdf`) with color tracing; flat cartoon art converts losslessly. The 3D-rendered nailong character PNGs stay raster by nature.
- All theme backgrounds and brand assets are now vector graphics.

## v0.2.3 - 2026-10-14

- Replace the traced crest with a clean vector source (Illustrator-exported SVG of the official emblem, converted to red/white PDFs), eliminating stroke wobble visible at high zoom.
- Re-trace the background with a grayscale-threshold mask and smoother curve fitting: crest, skyline, and calligraphy details now match the 8K master faithfully.

## v0.2.2 - 2026-10-13

- Fix inverted crest geometry in the vector logos: the alpha mask must be negated before tracing, otherwise the trace covers the whole canvas minus the crest and the title-page logo renders as a white box.
- Bump `.codex-plugin/plugin.json` alongside VERSION so `make release-check` passes.

## v0.2.1 - 2026-10-13

- Replace the 8K alpha-PNG slide background with a vector trace (`shanghaitech-master.pdf`), cutting per-page PDF render time by ~20x (1.41s to 0.07s) and shrinking `tutorial-red-shtu` from 1.75MB to 0.76MB.
- Trace the ShanghaiTech crest to vector (`ShanghaiTech_Logo.pdf`, `ShanghaiTech_Logo_White.pdf`) and remove the raster logo PNGs.
- Sync CS100 Recitation 1 with upstream CS100_Recitation: permission number fixes (664/775), `gzip` command name, wording and typo fixes, and `\texttt` forms for `~` and `#include` that `\lstinline`-based `\code` cannot render.

## v0.2.0 - 2026-08-20

- Align six Beamer themes, typography presets, section transitions, speaker blocks, callouts, covers, and end frames with VSP-Marp 0.2.0.
- Add six editable templates and five offline practice decks.
- Standardize report workflows on `report-red` and remove the duplicate `report` entry.
- Add the complete `vsp-beamer` Skill bundle with ten namespaced capabilities.
- Add strict XeLaTeX log checks and PDF visual auditing for all 11 documents.
- Add Linux-only TDS packaging and user-level `TEXMFHOME` install, verify, update, rollback, and uninstall workflows.
- Use system Noto CJK fonts and keep the distributable TDS archive compact.
- Add GitHub Actions and GitLab CI release validation and artifacts.
