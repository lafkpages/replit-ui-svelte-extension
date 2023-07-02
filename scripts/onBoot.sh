#!/usr/bin/env bash

# Symlink scripts into .config/bin, which should be in PATH
cd scripts
for file in *; do
  dest=`realpath "../.config/bin/${file:0:-3}"`
  if [ ! -f "$dest" ]; then
    ln -s `realpath "$file"` "$dest"
  fi
done
