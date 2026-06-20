#!/usr/bin/env bash
# Live preview with hot reload for included partials and iframe assets.
#
# Quarto's `quarto preview` only watches the file it renders (index.qmd), not
# the {{< include >}}'d partials in pages/ or the iframe HTML/SVG/CSS. This
# script watches those and `touch`es index.qmd when any change, which makes
# preview re-render and the browser hot-reload.
#
# Usage:  ./dev.sh        (Ctrl-C to stop)

set -e
cd "$(dirname "$0")"

# index.qmd declares `jupyter: python3`, so renders need the venv active.
# shellcheck disable=SC1091
source .venv/bin/activate

# Start Quarto preview in the background; kill it when this script exits.
# --no-navigate keeps the browser on index.html instead of jumping to a
# partial's standalone page (whose relative asset paths don't resolve).
quarto preview --no-navigate &
PREVIEW_PID=$!
trap 'kill "$PREVIEW_PID" 2>/dev/null' EXIT INT TERM

echo "watching pages/ and assets/ for changes — edit away (Ctrl-C to stop)"

# Poll for any watched file newer than index.qmd; if found, touch index.qmd
# so preview re-renders. After the touch nothing is newer until the next edit.
while true; do
  if find pages assets \
        \( -name '*.qmd' -o -name '*.html' -o -name '*.svg' -o -name '*.css' \) \
        -type f -newer index.qmd 2>/dev/null | grep -q .; then
    touch index.qmd
  fi
  sleep 1
done
