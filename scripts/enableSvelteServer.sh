#!/usr/bin/env bash

# Allow .replit to restart the LSP
sed -i '48 s/#//' .replit
