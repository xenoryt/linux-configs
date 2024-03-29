#!/usr/bin/bash

err() {
  echo "$*" >&2
}

if [ $# -lt 1 ]; then
  err "Usage: $0 PATH [NAME]"
  exit 1
fi

path="${1#/}"
name="${2:-dump}"

if [ -f $path ]; then
  name=$(basename "$path")
  path=$(dirname "$path")
fi

if [ -z "$name" ]; then
  if [ "$(ls "$path" | wc -l)" -gt 1 ]; then
    err "Please specify name of file to load:"
    ls "$path"
    exit 1
  else
    name="$(ls "$path")"
  fi
fi

name="${name%.dconf}"
echo "${path}/${name}.dconf"
