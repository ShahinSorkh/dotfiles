set t_Co=256
set cursorline

set foldenable foldmethod=syntax
set number autoindent smartindent
set expandtab shiftwidth=4 softtabstop=4

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