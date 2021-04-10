#!/bin/sh

src=`pwd`
dst="$HOME/.config/"

mkdir -p $dst

for config in `ls config/`; do
  if [ ! -d $dst/$config ]; then
    echo "Installing $config..."
    ln -s $src/config/$config $dst/$config
  fi
done
