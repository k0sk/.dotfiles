#!/bin/sh

set -e
set -u

setup() {
  dotfiles=$HOME/.dotfiles

  has() {
      type "$1" > /dev/null 2>&1
  }

  if [ -d "$dotfiles" ]; then
    (cd "$dotfiles" && make update)
  else
    git clone https://github.com/k0sk/.dotfiles "$dotfiles"
  fi

  has make && make install && make init
}

setup
