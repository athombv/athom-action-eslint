#!/bin/bash

# Exit if any subcommand fails
set -e 

SSH_KEY="$1"
echo "## Running ESLint"

if [ -n SSH_KEY ]; then
    echo "## Setting up SSH"
    eval "$(ssh-agent -s)"
    ssh-add - <<<"${SSH_KEY}"
    
    mkdir -p -m 700 ~/.ssh
    touch -m 600 ~/.ssh/known_hosts
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
    
    mkdir -p -m 700 $HOME/.ssh
    touch -m 600 $HOME/.ssh/known_hosts
    ssh-keyscan -H github.com >> $HOME/.ssh/known_hosts
    ssh-keyscan -t rsa github.com >> $HOME/.ssh/known_hosts
    echo "## Added SSH key"
fi

if [ -f package-lock.json ]; then
    setup="NODE_ENV=development npm ci --ignore-scripts &&"
else
    setup="NODE_ENV=development npm install --no-package-lock --ignore-scripts &&"
fi

sh -c "$setup ./node_modules/.bin/eslint ."
