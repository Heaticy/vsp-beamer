# Changelog

All notable changes to VSP-Beamer are documented in this file.

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
