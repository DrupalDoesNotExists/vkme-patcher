#!/bin/bash

# This script sets up the temporary $PATH
# so You don't have to switch between dirs
# a lot of times.

SCRIPTS_DIR=`realpath $(dirname $0)`

export PRE_VKME_PATH="$PATH"
export PATH="$PATH:$SCRIPTS_DIR"
