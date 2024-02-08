export PATH=$PATH:${HOME}/bin

[ -e ~/.shellrc ] && source ~/.shellrc

# reload
alias reload='source ~/.bash_profile'

# git
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
export PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\W\[\033[31m\]$(get_git_info_for_ps1)\[\033[00m\]\\$ '
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# ghq
[ -f "${HOME}/bin/opt/ghq-init.bash" ] && source "${HOME}/bin/opt/ghq-init.bash"

# direnv
if which direnv >/dev/null 2>&1; then eval "$(direnv hook bash)"; fi

[ -e ~/.bashrc.os ] && source ~/.bashrc.os
[ -e ~/.bashrc.local ] && source ~/.bashrc.local
