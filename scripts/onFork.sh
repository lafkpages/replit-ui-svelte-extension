#!/usr/bin/env bash

# This only runs when the Repl boots after being forked.
# This will run once, and then self-destruct

# If any of the bellow commands fail,
# the script will exit with a non-zero exit code
set -o pipefail


# Debug logs
echo "1" > /tmp/_replit_ui_svelte_extension_forked

# Remove template's Git repository
rm -rf ".git"

# Remove the extension ID from .replit config
sed -ri 's/^extensionID\s*=.+$//m' .replit
