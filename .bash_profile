export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# BEGIN ANSIBLE MANAGED BLOCK
# rbenv
export PATH=${HOME}/.rbenv/bin:${PATH}
eval "$(rbenv init -)"
# END ANSIBLE MANAGED BLOCK

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
