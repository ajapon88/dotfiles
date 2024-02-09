#!/bin/sh -e

git clone https://github.com/ajapon88/dotfiles ~/repos/github.com/ajapon88/dotfiles${DOTFILES_SUFFIX}
cd ~/repos/github.com/ajapon88/dotfiles${DOTFILES_SUFFIX}
./setup.sh
