#!/bin/bash

# This script applies the workspace patches
# to the existing Electron.js app installation.

CURRENT_DIR=`dirname $0`
export SCRIPTS_DIR="${SCRIPTS_DIR:-`realpath $CURRENT_DIR`}"
APP_DIR=${1:?Error: Missing app installation directory argument}
: ${VKPATCHER_WORKSPACE:?"No workspace selected"}

# Decompile the sources
TEMP_DIR=`mktemp --tmpdir -d vkmepatcher_apply_temp.XXXXXXXX`
$SCRIPTS_DIR/decompile_sources.sh "$APP_DIR" "$TEMP_DIR" || exit 1

# Apply git patches
cd $TEMP_DIR && git init || exit 1
PATCHES_DIR="$VKPATCHER_WORKSPACE/patches"

echo "Applying patches to the git repository"
git apply `find $PATCHES_DIR -type "f" -name "*.patch"` || exit 1

# TODO: Minify (and uglify) the sources to take less space

# Build the asar file
echo "Packaging the asar file and replacing the original"
asar pack "$TEMP_DIR" "$APP_DIR/resources/app.asar" || exit 1

# Remove temporary directory
rm -rf "$TEMP_DIR"
