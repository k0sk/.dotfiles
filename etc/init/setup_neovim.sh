#!/bin/bash
# See https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
# for more details.

trap 'echo Error: $0: stopped; exit 1' ERR INT
set -u
set -e

# A system that judge if this script is necessary or not
if !(type pyenv >/dev/null 2>&1 && type pyenv virtualenv >/dev/null 2>&1); then
  exit 0
fi

# Testing the judgement system
if [[ -n ${DEBUG:-} ]]; then echo "$0" && exit 0; fi

py2=$(pyenv install --list | grep -v - | grep -v b | grep -e '2\..*\..*' | tail -1)
py3=$(pyenv install --list | grep -v - | grep -v b | grep -e '3\..*\..*' | tail -1)

pyenv install $py2
pyenv install $py3

pyenv virtualenv $py2 neovim2
pyenv virtualenv $py3 neovim3

pyenv activate neovim2
pip install neovim
pyenv which python

pyenv activate neovim3
pip install neovim
pyenv which python

pyenv deactivate
