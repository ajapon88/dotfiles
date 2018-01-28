#!/bin/bash 

DOTFILES_PATH=$(cd $(dirname "${0}") ; pwd)
cd "${DOTFILES_PATH}"

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

[ ! -e "${HOME}/bin" ] && mkdir ${HOME}/bin

if [ -d "${DOTFILES_PATH}/bin" ]; then
  for file in `ls bin`; do
    ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/bin/${file}" "${HOME}/bin/${file}"
  done
fi
