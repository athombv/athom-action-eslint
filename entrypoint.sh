#!/bin/bash

# Exit if any subcommand fails
set -e 

echo "## Running ESLint"

if [ -n "$1" ]; then
    echo "## Setting up SSH"
    mkdir -p ~/.ssh
    eval "$(ssh-agent -s)"
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
    echo "## Keyscan completed"
    cat ~/.ssh/known_hosts
    ssh-add - <<<"$1"
    echo "## Added ssh key"
fi

if [ -f package-lock.json ]; then
    setup="NODE_ENV=development npm ci --ignore-scripts &&"
else
    setup="NODE_ENV=development npm install --no-package-lock --ignore-scripts &&"
fi

sh -c "$setup ./node_modules/.bin/eslint ."
