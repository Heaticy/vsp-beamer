---
name: vsp-beamer-resume
description: Resume interrupted VSP-Beamer work from an existing plan, TeX source, build PDF, LaTeX cache/log, screenshot contact sheet, or audit result. Use when the user says continue, resume, pick up where we stopped, or invokes vsp-beamer:resume / vb:resume.
---

# VSP-Beamer Resume

Continue from evidence; do not restart unless explicitly requested.

## Breakpoint detection

Check in this order:

1. Plan exists but target `.tex` does not: execute `../assets/SKILL.md`, then `../generate/SKILL.md`.
2. Target `.tex` exists but `build/<relative>.pdf` does not: execute `../render/SKILL.md`.
3. PDF exists but no current audit evidence/contact sheet: execute `../audit/SKILL.md`.
4. Audit or user feedback has unresolved Major/Minor items: execute `../polish/SKILL.md`.
5. Audit passes but deliverables are not organized: execute `../export/SKILL.md`.

## Process

1. Inspect user-provided paths, current repository state, recent files, `build/`, and relevant `.beamer-cache` logs when present.
2. Summarize the detected breakpoint and evidence.
3. Execute the next capability immediately when unambiguous.
4. Ask one minimal question only if multiple candidate decks or incompatible states make continuation unsafe.

Never delete a valid source or overwrite unrelated work as part of resume.
