#!/bin/bash

# This script decompiles the electron.js
# application to the given directories.

APP_DIR="${1:?Error: Missing application directory argument}"
OUT_DIR="${2:-`pwd`}"

# Check if asar is installed
! type "asar" > /dev/null && echo "No \`asar\` installed to extract the sources." && exit 1

# Verify that app dir is an electron.js app installation
$SCRIPTS_DIR/verify_electron.sh "$APP_DIR"; [[ ! $? == 0 ]] && echo "$APP_DIR is not an electron.js app" && exit 1

# Extract the .asar
echo "Extracting sources from the asar archive"
asar extract "$APP_DIR/resources/app.asar" "$OUT_DIR" || exit 1

# Beautify
$SCRIPTS_DIR/beautify_sources.sh "$OUT_DIR" || exit 1
