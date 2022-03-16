let g:rooter_cd_cmd="lcd"
let g:rooter_patterns = ['tags', 'setup.py', 'Rakefile', '.git/']
autocmd BufEnter * :Rooter
