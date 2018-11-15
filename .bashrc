export PATH=$PATH:${HOME}/bin

# reload
alias reload='source ~/.bash_profile'
alias relogin='exec $SHELL -l'
# bundler
alias bi='bundle install --path ./vendor/bundle'
alias bu='bundle update'
alias be='bundle exec'
# other
alias svn='colorsvn'
alias securerandom='ruby -r securerandom -e "puts SecureRandom.urlsafe_base64"'
alias rm-thumbs='find . -name "Thumbs.db" -print -exec rm -f {} \;'
alias rm-empties='find . -mindepth 1 -type d -empty -delete -print'
alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-delete-all-stop-contaners='docker rm $(docker ps -a -q)'
alias docker-delete-all-images='docker rmi $(docker images -q)'

# git
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '

# rbenv
if [ -d "${HOME}/.rbenv" ]; then
  export PATH=${HOME}/.rbenv/bin:${PATH}
  if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi
fi

# go
export GOPATH=~/go
export PATH=${GOPATH}/bin:${PATH}

# goenv
if [ -d "${HOME}/.goenv" ]; then
  export PATH=${HOME}/.goenv/bin:${PATH}
  if which goenv > /dev/null 2>&1; then eval "$(goenv init -)"; fi
fi

# direnv
if which direnv > /dev/null 2>&1; then eval "$(direnv hook bash)"; fi

# ghq
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
[ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

[ -e ~/.bashrc.os ] && source ~/.bashrc.os
[ -e ~/.bashrc.local ] && source ~/.bashrc.local
