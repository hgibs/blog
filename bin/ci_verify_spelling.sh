#!/bin/sh

if test -z "$HTML_DIR"; then
  HTML_DIR="tmp"
fi

find "$HTML_DIR" -iname '*.html' -exec sh -c 'cat "$1" | aspell -H --add-html-skip=code --home-dir=./ list' shell {} \; | tee "$HTML_DIR/spelling_result.txt"

if test "$(wc -l < "$HTML_DIR/spelling_result.txt")" -ne 0; then
  exit 1
fi

exit 0

