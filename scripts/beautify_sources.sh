#!/bin/bash

# This script uses nodejs to beautify the
# JS, CSS and HTML source code.

INPUT_DIR="${1:?Error: Missing input directory argument}"

# Check if the tools are installed
! type "prettier" > /dev/null && echo "No \`prettier\` installed." && exit 1

# Run beautifier and replace the inputs
echo "Running prettier on the $INPUT_DIR"
cd "$INPUT_DIR" && prettier -w "./**/*.{js, ts, css, html, json, wasm}" || exit 1
