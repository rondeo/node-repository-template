#!/bin/sh

# Avoid continuing when errors or undefined variables are present
set -eu

# Pass all the command line arguments to the application
sh -c "node ./build/index.js $*"
