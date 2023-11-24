#!/usr/bin/bash

# This script builds the patches from
# the git commit history in the SRC directory.

# Get the workspace paths
: ${VKPATCHER_WORKSPACE:?"No workspace selected"}
SRC_DIR="$VKPATCHER_WORKSPACE/src"
PATCHES_DIR="$VKPATCHER_WORKSPACE/patches"

# Format patches with git
cd "$SRC_DIR"
git format-patch `git rev-list HEAD | tail -2`..HEAD -o $PATCHES_DIR || exit 1
