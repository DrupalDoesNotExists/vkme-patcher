#!/bin/bash

# This script works prints the
# workspace and CLI versions.

# Test if the script should print
# the CLI version instead of workspace
[[ $1 == "cli" ]] && echo "0.0.1" && exit

# Check if there is a workspace selected
: ${VKPATCHER_WORKSPACE:?"No workspace selected"}

cat "$VKPATCHER_WORKSPACE/.vkmeta"
