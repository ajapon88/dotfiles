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
execute 'set runtimepath^=' . s:vim_dir
execute 'set runtimepath+=' . s:dein_dir

" Required:
call dein#begin(s:plugin_dir)

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
" 補完
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')
" call dein#add('supermomonga/neocomplete-rsense.vim')
call dein#add('marcus/rsense')

call dein#add('tomasr/molokai')

call dein#add('tpope/vim-endwise')
"
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell')

" Erlang
call dein#add('vim-erlang/vim-erlang-omnicomplete')
call dein#add('vim-erlang/vim-erlang-compiler')
call dein#add('vim-erlang/vim-erlang-tags')
call dein#add('vim-erlang/vim-erlang-runtime')
call dein#add('airblade/vim-rooter')
call dein#add('thinca/vim-quickrun')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('cohama/vim-hier')
call dein#add('dannyob/quickfixstatus')

" Required:
call dein#end()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" Vim終了時に現在のセッションを保存する
au VimLeave * mks!  ~/vimsession

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

" 全角スペース可視化
"augroup highlightIdegraphicSpace
"  autocmd!
"  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%

" -------------------------------
" Rsense
" -------------------------------
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplcache.vim
" --------------------------------
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" tag
" --------------------------------
"set tags+=.git/tags,tags
let g:rooter_use_lcd = 1
autocmd BufEnter * :Rooter

" --------------------------------
" watchdogs
" --------------------------------
"let g:quickrun_config = {
"    \ "watchdogs_checker/_" : {
"    \     "hook/close_quickfix/enable_exit" : 1,
"    \     "runner" : "vimproc",
"    \     "runner/vimproc/updatetime" : 10,
"    \     "outputter/quickfix/open_cmd" : "",
"    \     "hook/qfstatusline_update/enable_exit" : 1,
"    \     "hook/qfstatusline_update/priority_exit" : 4,
"    \ },
"    \ "erlang/watchdogs_checker" : {
"    \     "type" : "watchdogs_checker/flymake",
"    \ },
"    \ "watchdogs_checker/flymake" : {
"    \     "command"   : expand('~/.vim/bundle/vim-erlang-compiler/compiler/erlang_check.erl'),
"    \     "exec"      : "%c %o %s:p ",
"    \ },
"    \ }

"call watchdogs#setup(g:quickrun_config)

"let g:watchdogs_check_BufWritePost_enable = 1

" --------------------------------

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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
"set nowrap
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

