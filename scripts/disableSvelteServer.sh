#!/usr/bin/env bash

# Prevent .replit from restarting the LSP
sed -i '49 s/./#&/' .replit

# Kill running LSPs
kill -15 `ps -aef | grep "[s]velteserver" | awk '{ print $2 }'`
