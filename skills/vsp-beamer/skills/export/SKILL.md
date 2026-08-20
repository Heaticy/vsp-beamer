---
name: vsp-beamer-export
description: Prepare final VSP-Beamer deliverables and repository output for handoff, GitHub, GitLab, or release. Use when the user asks to export, package, organize final files, clean outputs, prepare a repository, or invokes vsp-beamer:export / vb:export.
---

# VSP-Beamer Export

Deliver editable sources and verified PDFs without committing transient build state.

## Inputs

- final `.tex` source and local assets
- final PDF or requested full `build/` tree
- audit/check evidence
- requested naming, destination, and release context

## Process

1. Confirm source and final PDF paths correspond.
2. Ensure `make check` has passed after the latest shared change.
3. Keep generated PDFs under `build/`; never recreate `dist/`.
4. Remove `.beamer-cache/`, `.vspi/`, temporary rasters, and obsolete output only when the user requests cleanup and verification is complete.
5. Keep `build/` ignored for source publication unless the user explicitly wants committed binaries.
6. For GitHub/GitLab, verify CI files, license, ignore rules, binary attributes, and individual file-size limits.
7. Do not commit, configure remotes, or push without explicit instruction and remote details.

## Output

Report:

- editable source and asset paths
- final PDF paths and counts
- validation evidence
- ignored/removed generated directories
- remaining release actions such as commit or remote setup
