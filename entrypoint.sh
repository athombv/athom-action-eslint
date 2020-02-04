#!/bin/bash

# Exit if any subcommand fails
set -e 

echo "## Running ESLint"
sh -c "npm install --only=dev && ./node_modules/.bin/eslint ."
