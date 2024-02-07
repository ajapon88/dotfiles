#!/bin/bash -eu

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

# directory
for dir in .vim bin; do
  ln -visnf "${DOTFILES_PATH}/${dir}" "${HOME}/${dir}"
done

# dotfiles
for file in .vimrc .zprofile .bash_profile .gitignore_global .screenrc .tmux.conf .tigrc .direnvrc .inputrc .asdfrc; do
  ln -visnf "${DOTFILES_PATH}/${file}" "${HOME}/${file}"
done

# dotfiles environment
for file in .env .bashrc .zshrc .gitconfig; do
  ln -visnf "${DOTFILES_PATH}/${file}" "${HOME}/${file}"
  [ -e "${DOTFILES_PATH}/${file}.${OS_SUFFIX}" ] && ln -visnf "${DOTFILES_PATH}/${file}.${OS_SUFFIX}" "${HOME}/${file}.os"
  [ ! -e "${HOME}/${file}.local" ] && touch "${HOME}/${file}.local"
done

# config
[ ! -e "${HOME}/.config" ] && mkdir "${HOME}/.config"
if [ -d "${DOTFILES_PATH}/.config" ]; then
  for file in $(ls .config); do
    ln -visnf "${DOTFILES_PATH}/.config/${file}" "${HOME}/.config/${file}"
  done
fi

case "${OS}" in
'Mac')
  # homebrew
  [ ! $(which brew) ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # bash -lc 'ansible-playbook -i ansible/hosts ansible/playbook.yml'
  brew bundle
  ;;
'Linux') ;;
'Windows') ;;
esac
