#!/usr/bin/env bash

cd "$(git rev-parse --show-toplevel)" || exit 1

# just list words first
find . -iname '*.adoc' -exec sh -c 'cat "$1" | aspell --home-dir=./ list' shell {} \;

# more helpful to convert to html, then scan in html mode, ignoring code blocks
rm tmp/*
find . -iname '*.adoc' -print0 | xargs -0 asciidoctor -D tmp -b html5 

find tmp -iname '*.html' -exec sh -c 'cat "$1" | aspell -H --add-html-skip=code --home-dir=./ list' shell {} \;


