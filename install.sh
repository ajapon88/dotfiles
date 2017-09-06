#!/bin/bash -x

DOTFILES_PATH=$(cd $(dirname "${0}") ; pwd)
LN_FORCE=
while getopts f opt
do
  case $opt in
    'f')  LN_FORCE=-f ;;
  esac
done

ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.vimrc" "${HOME}/.vimrc"
ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.vim" "${HOME}/.vim"
ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.bashrc" "${HOME}/.bashrc"
ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.bash_profile" "${HOME}/.bash_profile"
ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.gitconfig" "${HOME}/.gitconfig"

