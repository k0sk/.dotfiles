#!/bin/bash

trap 'echo Error: $0: stopped; exit 1' ERR INT
set -u
set -e

has() {
  type "$1" > /dev/null 2>&1
}

# Check if make and git are installed
if [[ $OSTYPE != darwin* ]]; then
  ! has make && echo "'make' has to be installed"
  ! has git && echo "'git' has to be installed"
else
  # Install git through Xcode CLT
  ! has git && echo "'git' has to be installed"; xcode-select --install
fi

dotfiles=$HOME/.dotfiles

if [ ! -d "$dotfiles" ]; then
  git clone https://github.com/k0sk/.dotfiles "$dotfiles"
fi

cd "$dotfiles"
make install
