---
name: vsp-beamer-plan
description: Plan a VSP-Beamer presentation before implementation. Use when the user asks to plan slides, design the deck structure, choose parameters or a theme, estimate page count, analyze source material, or invokes vsp-beamer:plan / vb:plan.
---

# VSP-Beamer Plan

Plan only. Do not edit or render unless the user asks to continue.

## Inputs

- source material paths or content: TeX, Markdown, PDF, paper, notes, or course material
- audience and scenario: teaching, paper report, project review, defense, or group meeting
- title, author, institute, date, duration, language, and required outputs
- theme preference and repository/output location

Infer available values from context before asking questions.

## Process

1. Confirm material paths and inspect headings, figures, formulas, tables, and code density.
2. Choose a theme using `../theme/SKILL.md`.
3. Plan cover, contents, sections, body pages, summary when useful, and end page.
4. Estimate page count from speaking duration and content density.
5. Plan figures from actual aspect ratio and information density; identify path or readability risks.
6. Decide where formulas remain TeX and where code needs `fragile` frames.
7. Define editable TeX and PDF output paths under the repository conventions.
8. Include render and audit verification in the plan.

## Output

Return a concise plan containing:

- source summary and assumptions
- audience, duration, and recommended theme with rationale
- section/page outline and estimated page count
- image/formula/code strategy
- asset risks and missing inputs
- output paths
- validation commands
- recommended next capability: usually `start`, `assets`, or `generate`
