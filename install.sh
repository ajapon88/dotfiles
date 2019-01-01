#!/bin/bash -e

export DOTFILES_PATH=$(
  cd $(dirname "${0}")
  pwd
)
cd "${DOTFILES_PATH}"

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
  OS_SUFFIX=osx
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  OS_SUFFIX=linux
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' -o "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
  OS='Windows'
  OS_SUFFIX=win
  export MSYS=winsymlinks:nativestrict
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

for file in .vimrc .vim .bashrc .bash_profile .gitconfig .gitignore_global .screenrc .tmux.conf .tigrc; do
  ln -visnf "${DOTFILES_PATH}/${file}" "${HOME}/${file}"
done
ln -visnf "${DOTFILES_PATH}/.gitconfig.${OS_SUFFIX}" "${HOME}/.gitconfig.os"
ln -visnf "${DOTFILES_PATH}/.bashrc.${OS_SUFFIX}" "${HOME}/.bashrc.os"

[ ! -e "${HOME}/.gitconfig.local" ] && touch "${HOME}/.gitconfig.local"
[ ! -e "${HOME}/.bashrc.local" ] && touch "${HOME}/.bashrc.local"

[ ! -e "${HOME}/.config" ] && mkdir "${HOME}/.config"
if [ -d "${DOTFILES_PATH}/.config" ]; then
  for file in $(ls .config); do
    ln -visnf "${DOTFILES_PATH}/.config/${file}" "${HOME}/.config/${file}"
  done
fi

[ ! -e "${HOME}/bin" ] && mkdir "${HOME}/bin"
if [ -d "${DOTFILES_PATH}/bin" ]; then
  for file in $(ls bin); do
    ln -visnf "${DOTFILES_PATH}/bin/${file}" "${HOME}/bin/${file}"
  done
fi

case "${OS}" in
'Mac')
  # homebrew
  [ ! $(which brew) ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  [ ! $(which ansible-playbook) ] && brew install ansible
  bash -lc 'ansible-playbook -i ansible/hosts ansible/playbook.yml'
  ;;
'Linux') ;;
'Windows') ;;
esac
