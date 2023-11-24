#!/bin/bash

# This script verifies the path to be
# an electron.js installation.

APP_DIR="${1:?Error: Missing application directory argument}"
exit `[[ -f $APP_DIR/LICENSE.electron.txt ]]`
