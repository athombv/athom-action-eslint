#!/bin/bash

# Exit if any subcommand fails
set -e 

SSH_KEY="$1"

echo "## Running ESLint"

if [ -n SSH_KEY ]; then
    echo "## Setting up SSH"
    eval "$(ssh-agent -s)"
    ssh-add - <<<"${SSH_KEY}"
    ssh -o StrictHostKeyChecking=no git@github.com
    echo "## Added SSH key"
fi

if [ -f package-lock.json ]; then
    setup="NODE_ENV=development npm ci --ignore-scripts &&"
else
    setup="NODE_ENV=development npm install --no-package-lock --ignore-scripts &&"
fi

sh -c "$setup ./node_modules/.bin/eslint ."
