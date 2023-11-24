#!/bin/bash

# This script uses nodejs to beautify the
# JS, CSS and HTML source code.

INPUT_DIR="${1:?Error: Missing input directory argument}"

# Check if the tools are installed
! type "js-beautify" > /dev/null && echo "No \`js-beautify\` installed." && exit 1

# Run beautifier and replace the inputs
js-beautify -r `find $INPUT_DIR -type "f" -name "*.js" -o -name "*.css" -o -name "*.html"` || exit 1
