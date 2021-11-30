#!/usr/bin/bash

set -e

file=$(bash parse-input.sh "$@")

name="$(basename "$file")"
path="$(dirname "$file")"

echo "Loading '$file' to /$path"
#dconf load "/$path" < "${path}/${name}.dconf"
