#!/bin/bash

for f in `ls $HOME/.dotfiles/bin`
do
  chmod 755 $HOME/.dotfiles/bin/$f
  cp $HOME/.dotfiles/bin/$f /usr/local/bin
done
