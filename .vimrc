call plug#begin()

Plug 'easymotion/vim-easymotion'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'             " github extension
" Plug 'shumphrey/fugitive-gitlab.vim' " gitlab extension

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'posva/vim-vue'
Plug 'jwalton512/vim-blade'
Plug 'digitaltoad/vim-pug'

call plug#end()

"""""""""""""""""""""""""""""""""""""""" core configs
syntax enable
colorscheme darcula

set t_Co=256
set encoding=utf-8
set fileencoding=utf-8
set number
set incsearch
set cursorline
set nocompatible
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let mapleader=','

hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE

nnoremap <CR> :noh<CR><CR>

"""""""""""""""""""""""""""""""""""""" Plugins configuration

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_javascript_checkers = ['standard --fix']
let g:syntastic_css_checkers = ['csslint', 'phpcs']
let g:syntastic_vue_checkers = ['standard --plugin html', 'tidy', 'phpcs']
let g:syntastic_blade_checkers = []
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_go_checkers = ['go']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_scss_checkers = ['sass']
let g:syntastic_sass_checkers = ['sass']
let g:syntastic_sh_checkers = ['sh']
let g:syntastic_sql_checkers = ['sqlint']
let g:syntastic_xml_checkers = ['xml']

" vim vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" vim vue nerd commenter integration
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction


" vim blade
autocmd FileType blade.php syntax sync fromstart
autocmd BufRead,BufNewFile *.blade.php setlocal filetype=blade
let g:vue_disable_pre_processors=1

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

" NERDTrees File highlighting
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

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v/?(\.(git|hg|svn)|vendor|node_modules|bower_components)$',
  \ 'file': '\v\.(log|min\.(css|js))$',
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rw'

" incsearch plugin
set hlsearch
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

map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

" fugitive
autocmd QuickFixCmdPost *grep* cwindow

" status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

""""""""""""""""""" my configurations
nnoremap <Leader>ev :vsplit ~/.vimrc<cr>
nnoremap <Leader>sv :source ~/.vimrc<cr>

nnoremap <Leader>w :bd<cr>
nnoremap <Tab> :bn!<cr>
nnoremap <s-Tab> :bN!<cr>

nnoremap <C-J> ddp
nnoremap <C-K> ddkO<esc>pkdd

inoremap jk <esc>
inoremap <esc> <nop>

