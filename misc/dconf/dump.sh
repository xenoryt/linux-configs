#!/usr/bin/bash

set -e

file=$(bash parse-input.sh "$@")

name="$(basename "$file")"
path="$(dirname "$file")"

echo "Dumping /$path to '$file'"
#dconf dump "/$path" > "${path}/${name}.dconf"
