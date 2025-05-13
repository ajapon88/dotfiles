# disable beep
setopt LIST_BEEP
setopt HIST_BEEP
setopt NO_BEEP

# bindkey
bindkey -e  # emacs

[ -e ~/.shellrc ] && source ~/.shellrc

# reload
alias reload='source ~/.zshrc'

# git
setopt PROMPT_SUBST
# https://redj.hatenablog.com/entry/2022/04/24/003944
get_git_info_for_ps1() {
  local GIT_INFO=$(__git_ps1 "%s")
  if [ -n "$GIT_INFO" ]; then
    local GIT_USER_NAME=$(git config --get user.name)
    if [ -z "$GIT_USER_NAME" ]; then
      GIT_USER_NAME="NO-USER-NAME"
    fi
    echo " ($GIT_USER_NAME@$GIT_INFO)"
  fi
}
export PROMPT='%F{green}%m%f:%F{cyan}%c%f%F{red}% $(get_git_info_for_ps1)%f$ '
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# ghq
# [ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

# direnv
if which direnv >/dev/null 2>&1; then eval "$(direnv hook zsh)"; fi
# asdf
if which asdf >/dev/null 2>&1; then eval "$(asdf completion zsh)"; fi

[ -e ~/.zshrc.os ] && source ~/.zshrc.os
[ -e ~/.zshrc.local ] && source ~/.zshrc.local
