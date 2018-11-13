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

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' -o  "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then                                                                                           
  OS='Windows'
  export MSYS=winsymlinks:nativestrict
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

for file in .vimrc .vim .bashrc .bash_profile .gitconfig .gitignore_global .screenrc .tmux.conf .tigrc; do
  ln -visn ${LN_FORCE} "${DOTFILES_PATH}/${file}" "${HOME}/${file}"
done

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

if [ "${OS}" == 'Mac' ]; then
  ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.gitconfig.osx" "${HOME}/.gitconfig.os"
  ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.bashrc.osx" "${HOME}/.bashrc.os"
  # homebrew
  [ ! `which brew` ] &&  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  [ ! `which ansible-playbook` ] && brew install ansible
  ansible-playbook -i ansible/hosts ansible/playbook.yml
elif [ "${OS}" == 'Windows' ]; then
  ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.gitconfig.win" "${HOME}/.gitconfig.os"
  ln -visn ${LN_FORCE} "${DOTFILES_PATH}/.bashrc.win" "${HOME}/.bashrc.os"
fi
