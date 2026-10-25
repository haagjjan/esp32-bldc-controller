#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
command -v latexmk >/dev/null || { echo "Install a TeX distribution with latexmk and pdfLaTeX." >&2; exit 1; }

# Keep generated PDF metadata stable for a given source revision.
export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(git log -1 --format=%ct 2>/dev/null || date +%s)}"
export FORCE_SOURCE_DATE=1
for document in proposal report; do
  (
    cd "docs/$document"
    latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error       -outdir=build -pdflatex='pdflatex -no-shell-escape %O %S' main.tex
  )
done

# Do not replace either checked-in PDF unless every document built successfully.
for document in proposal report; do
  cp "docs/$document/build/main.pdf" "docs/$document/main.pdf"
done
