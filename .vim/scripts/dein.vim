let s:vim_dir = expand('~/.vim/')

let s:plugin_dir = s:vim_dir . 'bundle/'
let s:dein_dir = s:plugin_dir . 'dein/repos/github.com/Shougo/dein.vim'


if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif


" Required:
execute 'set runtimepath+=' . s:dein_dir

if dein#load_state(s:dein_dir)
  " Required:
  call dein#begin(s:plugin_dir)

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:

  " colorscheme
  call dein#add('tomasr/molokai')

  if MeetNeocompleteRequirements()
    " neocomplete
    call dein#add('Shougo/neocomplete.vim')
  else
    " neocomplcache
    call dein#add('Shougo/neocomplcache.vim')
  endif

  " syntax
  call dein#add('w0rp/ale')

  " zenkaku space
  call dein#add('thinca/vim-zenspace')

  " rooter
  call dein#add('airblade/vim-rooter')


  " Required:
  call dein#end()
  call dein#save_state()
  "
  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endif

