# PDF Review

Use this checklist after rendering any changed deck.

## Automated checks

Run the focused audit:

```bash
./scripts/audit-pdf.sh build/path/to/deck.pdf
```

For shared changes, run:

```bash
make check
```

The strict log scan rejects:

- `Overfull`
- `Missing character`
- `LaTeX Error`
- `LaTeX Font Warning`
- package warnings

## Visual checks

Rasterize every page with Poppler and assemble a contact sheet with ImageMagick. Inspect:

- blank or unexpectedly duplicated pages
- text or images beyond page bounds
- text-text and text-image overlap
- distorted figures
- unreadably small labels or code
- bad line breaks in titles
- missing glyphs or fallback fonts
- inconsistent title, body, and footer sizes
- background branding hidden by opaque fills
- footlines covering bottom-edge artwork

Inspect representative pages at higher resolution when the contact sheet is ambiguous, especially title pages, section pages, dense code pages, image layouts, and the end page.

## False-positive handling

Do not weaken an audit rule until the flagged page has been visually inspected and its structured PDF boxes have been examined. Narrow the rule using evidence such as baseline alignment or object type, then rerun both the affected PDF and the full repository check.
