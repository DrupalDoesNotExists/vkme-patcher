#!/bin/bash

# This script sets up the PATH env
# var to include the current script
# directory

CURRENT_DIR=`dirname $0`
export SCRIPTS_DIR="${SCRIPTS_DIR:-`realpath $CURRENT_DIR`}"

# If the path is already set up
# remove the scripts dir from it
if [[ ":$PATH:" == *":$SCRIPTS_DIR:"* ]]; then
	echo "PATH is already set up, removing the $SCRIPTS_DIR from it."
	export PATH=$PREVKME_PATH
	unset SCRIPTS_DIR
	unset PREVKME_PATH
else
	echo "Adding $SCRIPTS_DIR to the PATH"
	export PREVKME_PATH=$PATH
	export PATH="$PATH:$SCRIPTS_DIR"
fi
