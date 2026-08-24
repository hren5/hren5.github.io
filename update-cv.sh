#!/bin/sh
# Copy the latest CV.pdf out of Dropbox and publish it to the website.
# Run this after recompiling CV.tex. Safe to run repeatedly: it does nothing
# when the PDF has not changed.
set -eu

SRC="/Users/hangren/Library/CloudStorage/Dropbox/0_Research_Drop/CV & website/CV/CV.pdf"

cd "$(dirname "$0")"

if [ ! -f "$SRC" ]; then
  echo "Error: CV.pdf not found at:"
  echo "  $SRC"
  echo "Recompile CV.tex first."
  exit 1
fi

cp "$SRC" cv.pdf
git add cv.pdf

if git diff --cached --quiet -- cv.pdf; then
  echo "CV unchanged; nothing to publish."
  exit 0
fi

git commit -q -m "Update CV ($(date +%Y-%m-%d))"
git push -q
echo "CV published. Live in about a minute."
