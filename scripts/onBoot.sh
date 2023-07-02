#!/usr/bin/env bash

cd scripts

for file in *; do
  dest=`realpath "../.config/bin/${file:0:-3}"`
  if [ ! -f "$dest" ]; then
    ln -s `realpath "$file"` "$dest"
  fi
done
