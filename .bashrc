export PATH=$PATH:${HOME}/bin

[ -e ~/.env ] && source ~/.env
[ -e ~/.env.local ] && source ~/.env.local

# reload
alias reload='source ~/.bash_profile'

# git
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# ghq
[ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

# direnv
if which direnv >/dev/null 2>&1; then eval "$(direnv hook 

[ -e ~/.bashrc.os ] && source ~/.bashrc.os
[ -e ~/.zsbashrchrc.local ] && source ~/.bashrc.local
