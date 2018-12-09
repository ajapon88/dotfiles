if &compatible
  set nocompatible               " Be iMproved
endif
filetype off
filetype plugin indent off

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

  " Required:
  call dein#end()
  call dein#save_state()
  "
  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endif

" Vim終了時に現在のセッションを保存する
au VimLeave * mks! ~/vimsession

"引数なし起動の時、前回のsessionを復元
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ~/vimsession | endif
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction

" --------------------------------
" 基本設定
" --------------------------------
syntax on
colorscheme molokai
set t_Co=256

" vim内部で使われる文字エンコーディングをutf-8に設定する
" 日本語だと文字化けするので英語に
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
" 想定される改行コードの指定する
set fileformats=unix,dos,mac

set number
set ruler
set incsearch
set hlsearch
set wrap
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set wrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
"set paste
set noswapfile
set nobackup
set confirm
set backspace=indent,eol,start
set autochdir

" filetype プラグインによる indent を on にする
filetype plugin indent on
" ESCでかなモードをオフにする
inoremap <Esc> <Esc>:set iminsert=0<CR>
" 挿入モード時の移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

