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

ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.vimrc" "${HOME}/.vimrc"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.vim" "${HOME}/.vim"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.bashrc" "${HOME}/.bashrc"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.bash_profile" "${HOME}/.bash_profile"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.gitconfig" "${HOME}/.gitconfig"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.gitignore_global" "${HOME}/.gitignore_global"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.screenrc" "${HOME}/.screenrc"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.tmux.conf" "${HOME}/.tmux.conf"
ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.tigrc" "${HOME}/.tigrc"

[ ! -e "${HOME}/.bashrc.local" ] && touch "${HOME}/.bashrc.local"

[ ! -e "${HOME}/.config" ] && mkdir "${HOME}/.config"

if [ -d "${DOTFILES_PATH}/.config" ]; then
  for file in `ls .config`; do
    ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.config/${file}" "${HOME}/.config/${file}"
  done
fi

[ ! -e "${HOME}/bin" ] && mkdir "${HOME}/bin"

if [ -d "${DOTFILES_PATH}/bin" ]; then
  for file in `ls bin`; do
    ln -visn ${LN_FORCE} "${DOTFILES_PATH}/bin/${file}" "${HOME}/bin/${file}"
  done
fi

[ ! -e "${HOME}/.gitconfig.local" ] && cp "${DOTFILES_PATH}/.gitconfig.local" "${HOME}/.gitconfig.local"

if [ "$(uname)" == 'Darwin' ]; then
  ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.gitconfig.osx" "${HOME}/.gitconfig.os"
fi

if [ "$(uname)" == 'Darwin' ]; then
  # homebrew
  [ ! `which brew` ] &&  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  [ ! `which ansible-playbook` ] && brew install ansible
  ansible-playbook -i ansible/hosts ansible/playbook.yml
fi
