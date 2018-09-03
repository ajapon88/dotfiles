# git
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1

export PATH=$PATH:${HOME}/bin

alias reload='source ~/.bash_profile'
alias relogin='exec $SHELL -l'
alias bi='bundle install --path ./vendor/bundle'
alias bu='bundle update'
alias be='bundle exec'
alias securerandom='ruby -r securerandom -e "puts SecureRandom.urlsafe_base64"'

if [ "$(uname)" == 'Darwin' ]; then
  alias dns-clean='sudo killall -HUP mDNSResponder'
fi

[ -e ~/.bashrc.local ] && source ~/.bashrc.local
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
source /usr/local/etc/bash_completion
# BEGIN ANSIBLE MANAGED BLOCK git
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
# END ANSIBLE MANAGED BLOCK git
