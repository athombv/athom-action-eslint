#!/bin/sh

# Exit if any subcommand fails
set -e 

if [ -z "$1" ]; then
    echo "## Setting up SSH"
    mkdir -p ~/.ssh
    eval "$(ssh-agent -s)"
    echo "## Added following ssh key"
    echo "$@"
    ssh-add - <<< "$@"
fi

echo "## Running ESLint"
sh -c "npm install --only=dev && ./node_modules/.bin/eslint ."
