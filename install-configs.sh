#!/bin/sh

src=`pwd`
dst="$HOME/.config/"

mkdir -p $dst

for config in `ls config/`; do
  ln -s $cwd/$config $dst/$config
done
