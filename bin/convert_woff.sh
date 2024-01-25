#!/usr/bin/env bash
fontpath="$(git rev-parse --show-toplevel)/assets_orig/fonts"

cd "$fontpath" || exit 1

for fontName in *.ttf; do
  echo $fontName
  docker run -it -v "$fontpath":/srv -w /srv scrlk/woff2 sh -c "woff2_compress $fontName"
done
