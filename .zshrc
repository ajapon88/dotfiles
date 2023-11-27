export PATH=$PATH:${HOME}/bin

# disable beep
setopt LIST_BEEP
setopt HIST_BEEP
setopt NO_BEEP

# bindkey
bindkey -e  # emacs

[ -e ~/.env ] && source ~/.env
[ -e ~/.env.local ] && source ~/.env.local

# reload
alias reload='source ~/.zshrc'

# git
setopt PROMPT_SUBST
export PROMPT='%F{green}%m%f:%F{cyan}%c%f%F{red}% $(__git_ps1)%f$ '
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# ghq
# [ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

# direnv
if which direnv >/dev/null 2>&1; then eval "$(direnv hook zsh)"; fi

[ -e ~/.zshrc.os ] && source ~/.zshrc.os
[ -e ~/.zshrc.local ] && source ~/.zshrc.local
