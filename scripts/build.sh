#!/usr/bin/env bash

# Disable LSPs to have more RAM
disableSvelteServer

# Run the SvelteKit build adapter
npm run build

# Reenable LSPs
enableSvelteServer
