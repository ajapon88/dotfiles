if &compatible
  set nocompatible               " Be iMproved
endif
filetype off
filetype plugin indent off

function! MeetNeocompleteRequirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

source ~/.vim/scripts/dein.vim

if MeetNeocompleteRequirements()
  source ~/.vim/scripts/neocomplete.vim
else
  source ~/.vim/scripts/neocomplcache.vim
endif

source ~/.vim/scripts/ale.vim
source ~/.vim/scripts/rooter.vim
source ~/.vim/scripts/config.vim

filetype plugin indent on

