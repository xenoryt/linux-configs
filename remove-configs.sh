#!/bin/sh

dst="$HOME/.config/"

for config in `ls config/`; do
  rm $dst/$config
done
