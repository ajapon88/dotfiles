# git
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '

export PATH=$PATH:${HOME}/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias bi='bundle install --path ./vendor/bundle'
alias be='bundle exec'

[ -e ~/.bashrc.local ] && source ~/.bashrc.local
