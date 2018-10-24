export PATH=$PATH:${HOME}/bin

# reload
alias reload='source ~/.bash_profile'
alias relogin='exec $SHELL -l'
# bundler
alias bi='bundle install --path ./vendor/bundle'
alias bu='bundle update'
alias be='bundle exec'
# other
alias securerandom='ruby -r securerandom -e "puts SecureRandom.urlsafe_base64"'
alias dns-clean='sudo killall -HUP mDNSResponder'
alias rm-dsstores='find . -name ".DS_Store" -print -exec rm -f {} \;'
alias rm-thumbs='find . -name "Thumbs.db" -print -exec rm -f {} \;'
alias rm-empties='find . -mindepth 1 -type d -empty -delete -print'

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# completion
for file in "bash_completion" "bash_completion.d/git-prompt.sh" "bash_completion.d/git-completion.bash"; do
    file_path=$(brew --prefix)/etc/${file}
    [ -f "${file_path}" ] && source "${file_path}"
done

# git
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '

# rbenv
export PATH=${HOME}/.rbenv/bin:${PATH}
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# direnv
if which direnv > /dev/null; then eval "$(direnv hook bash)"; fi

# ghq
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
[ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

[ -e ~/.bashrc.local ] && source ~/.bashrc.local
