#!/usr/bin/env bash

if test -z "$HTML_DIR"; then
  HTML_DIR="tmp"
fi

asciidoctor -D "$HTML_DIR" -b html5 _posts/*.adoc

