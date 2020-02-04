#!/bin/sh

# Exit if any subcommand fails
set -e 

echo "## Running ESLint"

if [ -n "$1" ]; then
    echo "## Setting up SSH"
    mkdir -p ~/.ssh
    eval "$(ssh-agent -s)"
    echo "## Added following ssh key"
    echo "$1" || ssh-add -
    ssh-add -l
fi

if [ -f package-lock.json ]; then
    setup="NODE_ENV=development npm ci --ignore-scripts &&"
else
    setup="NODE_ENV=development npm install --no-package-lock --ignore-scripts &&"
fi

sh -c "$setup ./node_modules/.bin/eslint ."
