#!/bin/bash

trap 'echo Error: $0: stopped; exit 1' ERR INT
set -u
set -e

# A system that judge if this script is necessary or not
if [[ $OSTYPE != darwin* ]]; then
    exit 0
fi
if !(type brew >/dev/null 2>&1); then
    exit 0
fi

# Testing the judgement system
if [[ -n ${DEBUG:-} ]]; then echo "$0" && exit 0; fi

echo 'Installing Homebrew packages...'
brew tap rcmdnk/file && brew install brew-file
brew file install --preupdate -f .brewfile
