SHELL := /bin/bash

LATEXMK ?= latexmk
LATEXMK_FLAGS := -xelatex -interaction=nonstopmode -halt-on-error -file-line-error
TEXINPUTS_ENV := $(CURDIR)/themes//:$(CURDIR)//:
VERSION := $(strip $(shell cat VERSION))
PACKAGE ?= build/vsp-beamer-$(VERSION).tds.tar.gz

DOCUMENTS := $(shell find templates practice -type f -name '*.tex' -exec grep -l '\\documentclass' {} + | sort)
PDFS := $(patsubst %.tex,build/%.pdf,$(DOCUMENTS))
THEME_FILES := $(shell find themes -type f \( -name '*.sty' -o -name '*.md' \))
ASSET_FILES := $(shell find shared-assets practice -type f \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \))

.PHONY: all build audit check release-check release render list clean update-check package install status verify-install uninstall rollback upgrade

all: update-check build

update-check:
	@./scripts/check-update.sh || true

build: $(PDFS)

list:
	@printf '%s\n' $(DOCUMENTS)

.SECONDEXPANSION:
build/%.pdf: %.tex $(THEME_FILES) $(ASSET_FILES) $$(wildcard $$(dir $$*)*.tex)
	@mkdir -p ".beamer-cache/$*" "$(dir $@)"
	@echo "[xelatex] $<"
	@TEXINPUTS="$(TEXINPUTS_ENV)" $(LATEXMK) $(LATEXMK_FLAGS) \
		-outdir=".beamer-cache/$*" "$<"
	@cp ".beamer-cache/$*/$(notdir $(basename $<)).pdf" "$@"
	@echo "  -> $@"

audit: build
	@./scripts/audit-pdf.sh $(PDFS)

release-check:
	@./scripts/check-release.sh

check: release-check build
	@set -euo pipefail; \
	pattern='Overfull|Missing character|LaTeX Error|LaTeX Font Warning|Package .* Warning|Class beamer Warning'; \
	failed=0; \
	while IFS= read -r log; do \
		if grep -En "$$pattern" "$$log"; then failed=1; fi; \
	done < <(find .beamer-cache -type f -name '*.log' | sort); \
	if [[ $$failed -ne 0 ]]; then \
		echo 'VSP-Beamer check failed.' >&2; exit 1; \
	fi; \
	echo 'All VSP-Beamer documents compiled without overflow, missing glyphs, font warnings, or package warnings.'
	@./scripts/audit-pdf.sh $(PDFS)

release: check package

render:
	@if [[ -z "$(INPUT)" ]]; then \
		echo 'Usage: make render INPUT=path/to/slides.tex [OUTPUT=/tmp/slides.pdf]' >&2; exit 2; \
	fi
	@set -euo pipefail; \
	input="$(INPUT)"; \
	rel="$${input%.tex}"; \
	build_dir=".beamer-cache/$$rel"; \
	output="$(OUTPUT)"; \
	if [[ -z "$$output" ]]; then output="build/$$rel.pdf"; fi; \
	mkdir -p "$$build_dir" "$$(dirname "$$output")"; \
	TEXINPUTS="$(TEXINPUTS_ENV)" $(LATEXMK) $(LATEXMK_FLAGS) -outdir="$$build_dir" "$$input"; \
	cp "$$build_dir/$$(basename "$$rel").pdf" "$$output"; \
	echo "$$output"

package:
	@./scripts/vsp-beamer package --output "$(PACKAGE)"

install:
	@./scripts/vsp-beamer install --from "$(CURDIR)"

status:
	@./scripts/vsp-beamer status

verify-install:
	@./scripts/vsp-beamer verify

uninstall:
	@./scripts/vsp-beamer uninstall

rollback:
	@./scripts/vsp-beamer rollback

upgrade:
	@set -euo pipefail; \
	git rev-parse --verify HEAD >/dev/null 2>&1 || { echo 'No Git commit exists yet; publish the initial commit before make upgrade can be used.' >&2; exit 2; }; \
	git remote get-url origin >/dev/null 2>&1 || { echo 'No origin remote is configured.' >&2; exit 2; }; \
	git diff --quiet && git diff --cached --quiet || { echo 'Refusing to upgrade a checkout with tracked changes.' >&2; exit 2; }; \
	git pull --ff-only

clean:
	rm -rf .beamer-cache build
