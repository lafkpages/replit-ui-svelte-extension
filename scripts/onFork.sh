#!/usr/bin/env bash

# This only runs when the Repl boots after being forked.
# This will run once, and then self-destruct

if [ "$1" != "yesplease" ]; then
  echo "This script is not intended to be run manually."
  exit 1
fi

# If any of the bellow commands fail,
# the script will exit with a non-zero exit code
set -o pipefail

cd "$REPL_HOME"

# Debug logs
echo "1" > /tmp/_replit_ui_svelte_extension_forked

# Remove template's Git repository
rm -rf ".git"

# Remove the extension ID from .replit config
sed -ri 's/^extensionID\s*=.+$//m' .replit
