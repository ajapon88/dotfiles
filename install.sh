#!/bin/bash -e

export DOTFILES_PATH=$(cd $(dirname "${0}") ; pwd)
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
ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.screenrc" "${HOME}/.screenrc"

[ ! -e "${HOME}/.bashrc.local" ] && touch "${HOME}/.bashrc.local"

[ ! -e "${HOME}/bin" ] && mkdir "${HOME}/bin"
[ ! -e "${HOME}/bin/opt" ] && mkdir "${HOME}/bin/opt"

if [ -d "${DOTFILES_PATH}/bin" ]; then
  for file in `ls bin`; do
    ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/bin/${file}" "${HOME}/bin/${file}"
  done
fi

[ ! -e "${HOME}/.gitconfig.local" ] && cp "${DOTFILES_PATH}/.gitconfig.local" "${HOME}/.gitconfig.local"

if [ "$(uname)" == 'Darwin' ]; then
  ln -i -s ${LN_FORCE} "${DOTFILES_PATH}/.gitconfig.osx" "${HOME}/.gitconfig.os"
fi

if [ "$(uname)" == 'Darwin' ]; then
  # homebrew
  [ ! `which brew` ] &&  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  [ ! `which ansible-playbook` ] && brew install ansible
  ansible-playbook -i ansible/hosts ansible/playbook.yml
fi
