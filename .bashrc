export PATH=$PATH:${HOME}/bin

[ -e ~/.env ] && source ~/.env
[ -e ~/.env.local ] && source ~/.env.local

# reload
alias reload='source ~/.bash_profile'
alias relogin='exec $SHELL -l'
# bundler
alias bi='bundle install --path ./vendor/bundle'
alias bu='bundle update'
alias be='bundle exec'
# other
alias securerandom='ruby -r securerandom -e "puts SecureRandom.urlsafe_base64"'
alias rm-thumbs='find . -name "Thumbs.db" -print -exec rm -f {} \;'
alias rm-empties='find . -mindepth 1 -type d -empty -delete -print'
alias docker-stop-all='docker stop $(docker ps -q)'
alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-delete-all-contaners='docker rm $(docker ps -a -q)'
alias docker-delete-all-images='docker rmi $(docker images -q)'
alias docker-delete-all-volumes='docker volume rm $(docker volume ls -qf dangling=true)'
alias shfmt='shfmt -i 2 -ci -bn -s'

if which colorsvn >/dev/null 2>&1; then alias svn='colorsvn'; fi

# git
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# rbenv
export PATH=${HOME}/.rbenv/bin:${PATH}
if which rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi

# python
export PYTHONUSERBASE=${HOME}/.local
export PATH=${PATH}:${PYTHONUSERBASE}/bin
if [ -f virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  source virtualenvwrapper.sh
fi
# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/shims:$PATH"
if which pyenv > /dev/null 2>&1; then eval "$(pyenv init -)"; fi

# go
goenv=${HOME}/.goenv/bin
if [ -d "${goenv}" ]; then export PATH=${goenv}:${PATH}; fi
if which goenv >/dev/null 2>&1; then
  eval "$(goenv init -)"
else
  export GOPATH=~/go
fi
export PATH=${GOPATH}/bin:${PATH}

# direnv
if which direnv >/dev/null 2>&1; then eval "$(direnv hook bash)"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# ghq
alias g='cd $(ghq root)/$(ghq list | sort | peco)'
alias gh='hub browse $(ghq list | sort | peco | cut -d "/" -f 2,3)'
alias gd='cd $(ghq root)'
[ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

# android
if [ -z "${ANDROID_HOME}" ]; then
  if [ -d "${HOME}/Library/Android/sdk" ]; then
    export ANDROID_HOME="${HOME}/Library/Android/sdk"
  elif [ -d "/Applications/android-sdk" ]; then
    export ANDROID_HOME="/Applications/android-sdk"
  elif [ -d "${HOME}/AppData/Local/Android/Sdk" ]; then
    export ANDROID_HOME="${HOME}/AppData/Local/Android/Sdk"
  fi

  alias android-tools='echo "${ANDROID_HOME}/tools"'
  alias android='$(android-tools)/android'
  
  alias android-platform-tools='echo "${ANDROID_HOME}/platform-tools"'
  alias adb='$(android-platform-tools)/adb'
  
  alias android-build-tools='echo "${ANDROID_HOME}/build-tools/$(ls -1 ${ANDROID_HOME}/build-tools | sort -rn | head -1)"'
  alias aapt='$(android-build-tools)/aapt'
fi

[ -e ~/.bashrc.os ] && source ~/.bashrc.os
[ -e ~/.bashrc.local ] && source ~/.bashrc.local
