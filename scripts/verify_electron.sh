#!/bin/bash

# This script verifies the path to be
# an electron.js installation.

APP_DIR="${1:?Error: Missing application directory argument}"
IS_ELECTRON=`[[ -f $APP_DIR/LICENSE.electron.txt ]]`

$IS_ELECTRON && [[ "$(read -e -p 'No LICENSE.electron.txt file is detected under the APP DIRECTORY. Is it ok? [y/N]> '; echo $REPLY)" == [Yy]* ]] && exit 0 || exit 1
