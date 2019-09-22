set t_Co=256
set cursorline

set foldenable foldmethod=syntax
set number autoindent smartindent
set expandtab shiftwidth=4 softtabstop=4

set path+=**
set wildignore+=*/.git/*,*/tmp/*,*.so,*.swp,*.zip,*.tar,*.bz,*.bz2,*.gz,*.xz,*.rar,*.phar,*.jar
set wildignore+=*/node_modules/*,*/vendor/*,*/bower_components/*,*/storage/framework/*
set wildignore+=*/__pycache__/*,*.pyc

nnoremap <C-p> :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = '0'


set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
scriptencoding utf-8

filetype plugin indent on
syntax enable

augroup rememberlastline
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * if &filetype != '' | silent! loadview | endif
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
let g:mapleader=','

nnoremap z/ /\v
nnoremap z? ?\v
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$

cnoremap w!! w !sudo tee % >/dev/null
