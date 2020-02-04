#!/bin/sh

# Exit if any subcommand fails
set -e 

echo "## Running ESLint"

if [ -n "$1" ]; then
    echo "## Setting up SSH"
    mkdir -p ~/.ssh
    eval "$(ssh-agent -s)"
    echo "## Added following ssh key"
    ssh-add - <<< "$1"
fi

sh -c "npm install --only=dev && ./node_modules/.bin/eslint ."
