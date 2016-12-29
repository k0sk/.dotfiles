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

pyenv virtualenv $py2 neovim2
pyenv virtualenv $py3 neovim3

cat << EOS
Next, you should run below.
> pyenv activate neovim(2|3)
> pip install neovim
> pyenv which python

If you wanna use some plugins regardless of what env is currently active, you should run below, too.
> pip install pep8
> ln -s `pyenv which pep8` $HOME/bin # Assumes that $HOME/bin is in \$PATH
EOS
