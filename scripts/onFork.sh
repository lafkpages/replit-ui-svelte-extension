#!/usr/bin/env bash

# This only runs when the Repl boots after being forked.
# This will run once, and then self-destruct


# Debug logs
echo "1" > /tmp/_replit_ui_svelte_extension_forked

# Remove template's Git repository
rm -rf ".git"
