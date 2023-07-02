#!/usr/bin/env bash

cd scripts

for file in *; do
  ln -s `realpath "$file"` "../.config/bin/${file:0:-3}"
done
