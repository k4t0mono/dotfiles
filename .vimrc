" Vim config
" 
" KatoMono Enkeli <k4t0mono@gmail.com>

" # General config {{{

" Enable syntax
syntax enable

" <3 UTF-8
set encoding=utf8

" Set leader
let mapleader=","

" Indentation
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" }}}

" # UI Config {{{

" ## General {{{

" No wraping lines
set nowrap

" Line number
set number

" Show commad bar
set showcmd

" Comand line completation
set wildmenu

" Horizontal cursor offset
set so=7

" Highlight the current line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgrey

" Redraw only is needed
set lazyredraw

" Highlight matching [{()}]
set showmatch

" Split place
set splitbelow
set splitright

" No backup
set nobackup
set nowb
set noswapfile


" }}}

" ## Searching {{{

" Search dynamically
set incsearch

" Highlight matches
set hlsearch

" Ignore case when searching
set ignorecase

" Use smartcase
set smartcase

" Use magic for RegEx
set magic

" }}}

" ## Foldind {{{

" Enable folding
set foldenable

" Open some fold
set foldlevelstart=5

" Fold vased on indent level
set foldmethod=indent

" }}}

" }}}

" # Shortcuts {{{

" Fast save
nnoremap <leader>w :w<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open/Close folds with <space>
nnoremap <space> za

" Tabs nav
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Git
nnoremap <leader>ep :!python % <CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gaa :Git add .<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>

" }}}

" # Plug {{{

call plug#begin('~/.vim/plugged')

" ## Dev

Plug 'rust-lang/rust.vim'           " Rust Suport
Plug 'scrooloose/nerdcommenter'     " Easy commenting
Plug 'scrooloose/syntastic'         " Syntax checking
Plug 'tpope/vim-fugitive'           " Git wrapper
Plug 'jelera/vim-javascript-syntax'	" JavaScript
Plug 'elzr/vim-json'                " JSON Suport
Plug 'valloric/YouCompleteMe'       " Code-completion


" ## Tools

Plug 'scrooloose/nerdtree'          " File nav
Plug 'xuyuanp/nerdtree-git-plugin'  " Git suport for NerdTree
Plug 'tmhedberg/simpylfold'         " Folding
Plug 'jamessan/vim-gnupg'           " Edit .gpg and .asc files
Plug 'bling/vim-airline'            " Statusbar
Plug 'vimwiki/vimwiki'              " Personal wiki
Plug 'chriskempson/base16-vim'      " Base-16
Plug 'flazz/vim-colorschemes'       " Colorschemes
Plug 'ap/vim-css-color'             " CSS color preview


call plug#end()

" }}}

" # Pluggins config {{{

" ## NERDTree {{{

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node-modules']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

" ## SimpyFold {{{ 

" show docstring
let g:SimpylFold_docstring_preview=1

" }}}

" ## Base16 {{{ 

" Base16
let base16colorspace=256
set t_Co=256
color dracula

" }}}

" ## YouCompleteMe {{{

let g:ycm_autoclose_preview_window_after_completion=1

" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
