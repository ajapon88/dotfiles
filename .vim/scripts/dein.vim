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
  " call dein#add('Shougo/dein.vim')

  let g:config_dir  = expand('~/.vim/dein/config')
  let s:toml        = g:config_dir . '/plugins.toml'
  let s:lazy_toml   = g:config_dir . '/plugins_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
  "
  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endif
