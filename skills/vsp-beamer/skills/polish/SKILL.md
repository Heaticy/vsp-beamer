---
name: vsp-beamer-polish
description: Repair an existing VSP-Beamer deck from audit findings, screenshots, build diagnostics, or user feedback. Use when the user asks to fix, revise, polish, improve layout, address review findings, or invokes vsp-beamer:polish / vb:polish.
---

# VSP-Beamer Polish

Apply evidence-driven repairs to source, then rerender and re-audit.

## Inputs

- target `.tex` and theme
- audit report, screenshots, PDF, logs, or user feedback
- affected page numbers and desired outcome when available

## Process

1. Reproduce the issue from current source and PDF.
2. Classify findings as Major, Minor, or Suggestion using `../audit/SKILL.md`.
3. Fix Major issues first: compile errors, missing assets/glyphs, overflow, overlap, distortion, unreadable content, or hidden required branding.
4. Fix Minor issues next: density, spacing, line breaks, image area, hierarchy, and consistency.
5. Put reusable fixes in the shared theme and document-specific fixes in the target source; do not spread local patches across templates.
6. Rerender through `../render/SKILL.md`.
7. Re-audit affected pages and run full `make check` after shared changes.
8. Stop only when Major findings are resolved or a concrete blocker is documented.

## Output

Report changed files, issue-to-fix mapping, new PDF path, verification results, and any remaining Minor/Suggestion items.
