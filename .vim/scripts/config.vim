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

" ESCでかなモードをオフにする
inoremap <Esc> <Esc>:set iminsert=0<CR>
" 挿入モード時の移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

