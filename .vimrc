syntax enable

colorscheme darcula
set t_Co=256
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

set encoding=utf-8
set fileencoding=utf-8

set incsearch
set hlsearch
set ignorecase
set smartcase

set number
set nocompatible

set cursorline
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE

nnoremap <CR> :noh<CR><CR>
let mapleader=','

"""""""""""""""""""""""""""""""""""""" Plugins configuration


" vim vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
let g:vue_disable_pre_processors=1

" vim blade
autocmd FileType blade syntax sync fromstart
autocmd BufRead,BufNewFile *.blade.php setlocal filetype=blade


" fugitive
autocmd QuickFixCmdPost *grep* cwindow

" vim-autosave
nnoremap <Leader>as :AutoSaveToggle<CR>
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_write_all_buffers = 1
let g:auto_save_no_updatetime = 1

" easy motion
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" nerdtree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg=#ffffff guifg=#151515'
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini', 'yellow', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none')
call NERDTreeHighlightFile('py', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none')
call NERDTreeHighlightFile('vue', 'Red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none')

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeChDirMode = 2

map <C-n> :NERDTree<CR>
map <C-N> :NERDTreeToggle<CR>

" ctrl p
map <C-p> :CtrlP<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.bz,*.bz2,*.gz,*.xz,*.rar,*.phar,*.jar
set wildignore+=*/node_modules/*,*/vendor/*,*/bower_components/*,*/storage/framework/*

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v/?(\.(git|hg|svn)|vendor|node_modules|bower_components)$',
  \ 'file': '\v\.(log|min\.(css|js))$',
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rw'

" incsearch plugin
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" status line
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

""""""""""""""""""" my configurations

nnoremap <Leader>ev :vsplit ~/.vimrc<cr>
nnoremap <Leader>sv :source ~/.vimrc<cr>

nnoremap <Leader>w :bd<cr>
nnoremap <Tab> :bn!<cr>
nnoremap <s-Tab> :bN!<cr>

nnoremap <C-J> ddp
nnoremap <C-K> ddkO<esc>Pjddk

inoremap jk <esc>
inoremap <esc> <nop>

cnoremap w!! w !sudo tee > /dev/null % <cr> edit!<cr>
