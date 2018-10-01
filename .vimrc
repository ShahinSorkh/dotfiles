set t_Co=256
set cursorline
colorscheme spacegray

set encoding=utf-8
set fileencoding=utf-8
set ff=unix

set incsearch
set hlsearch
set ignorecase
set smartcase

set splitbelow
set splitright

set autoindent
set smartindent
syntax enable

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set nocompatible
set nobackup
set noswapfile
set number
set signcolumn=yes
set lazyredraw

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set scrolloff=2

set backspace=indent,eol,start
nnoremap <CR> :noh<CR><CR>
let mapleader=','


"""""""""""""""""""""""""""""""""""""" Plugins configuration

" ale
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\ }
let g:ale_list_window_size = 5
let g:ale_use_global_executables = 1

nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

let g:ale_linter_aliases = {
\  'vue': ['javascript', 'html', 'css'],
\  'blade': ['php', 'javascript', 'css', 'html'],
\  }

" ale linters
let g:ale_linters = {
\  'javascript': ['standard'],
\  'html': ['alex', 'tidy'],
\  'text': ['alex'],
\  'markdown': ['alex'],
\  'css': ['stylelint'],
\  'json': ['jsonlint'],
\  'vue': ['standard', 'stylelint'],
\  'scss': ['stylelint'],
\  'sass': ['stylelint'],
\  'python': ['pylint'],
\  'php': ['phpmd']
\  }

" ale fixers
let g:ale_fixers = {
\  'javascript': ['standard'],
\  'html': ['tidy'],
\  'css': ['stylelint'],
\  'vue': ['standard', 'tidy', 'stylelint'],
\  'json': ['jsonlint'],
\  'scss': ['stylelint'],
\  'sass': ['stylelint'],
\  'python': ['flake8'],
\  'php': ['phpmd']
\  }

" ale options
let g:ale_javascript_standard_options = '-v'
let g:ale_vue_standard_options = '--plugin html'
let g:ale_html_tidy_options = '-i -wrap 80 -omit -ashtml -utf8 --indent-cdata --indent --indent-spaces 4 --sort-attributes alpha --tab-size 4 --newline LF'


" vim vue
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" vim blade
autocmd FileType blade syntax sync fromstart
autocmd BufRead,BufNewFile *.blade.php setlocal filetype=blade


" fugitive
autocmd QuickFixCmdPost *grep* cwindow

" vim-gitgutter
let g:gitgutter_diff_args = '-w'
nnoremap <Leader>gglh :GitGutterLineHighlightsToggle<CR>
autocmd BufWrite * GitGutter

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
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
  \ 'dir':  '\v/?(\.(git|hg|svn)|vendor|node_modules|bower_components|storage\/framework)$',
  \ 'file': '\v\.(log|min\.(css|js))$',
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = '0'

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

packadd incsearch-fuzzy.vim

function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

" status line
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*

if exists("#airline")
  AirlineRefresh
endif

"""""""""""""""""" my configurations

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

nnoremap <space> za
nnoremap Y y$

nnoremap <Leader>ev :vsplit ~/.vimrc<cr>
nnoremap <Leader>sv :source ~/.vimrc<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap n nzz
nnoremap N Nzz
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

nnoremap <Leader>w :bd<cr>
nnoremap <Tab> :bn!<cr>
nnoremap <S-Tab> :bN!<cr>

nnoremap <C-J> :m+<cr>
nnoremap <C-K> :m-2<cr>

inoremap jk <esc>
inoremap <esc> <nop>

cnoremap w!! w !sudo tee > /dev/null % <cr> edit!<cr>
