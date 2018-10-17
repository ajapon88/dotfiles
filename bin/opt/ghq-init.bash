#!/bin/bash

function ghq-init() {
  if [ $# -ne 1 ]; then
    echo "USAGE:"
    echo "    ghq-init <path>"
    return 1
  fi
  local root=$(ghq root)
  cd "${root}"
  local repo=$1
  if [ -e "${repo}" ]; then
    echo "${repo} is already exists."
    return 1
  fi
  git init "${repo}"
  cd "${repo}"
}

_ghq-init() {
  local cur prev cword opts
  _get_comp_words_by_ref -n : cur prev cword
  root=$(ghq root)
  dir="$(echo ${cur} | grep -o ".*/")"
  if test "${dir}" ;then
    COMPREPLY=( $(compgen -W "$(ls -F "$root/${dir}" | sed -E "s@(.*)@${dir}\1@g" | grep -o ".*/$")" -- "${cur}") )
  else 
    COMPREPLY=( $(compgen -W "$(ls -F "$root/" | grep -o ".*/$")" -- "${cur}") )
  fi
} &&
complete -o nospace -o default -F _ghq-init ghq-init
