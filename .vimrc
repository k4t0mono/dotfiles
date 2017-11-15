" My personal vim config
"
" KatoMono Enkeli <k4t0mono@gmail.com>

" # Leader shortcuts {{{

" Git
nnoremap <leader>ep :!python % <CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gaa :Git add .<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>

" Rust
nnoremap <leader>cr :!cargo run<CR>
nnoremap <leader>cb :!cargo build<CR>

" Python
nnoremap <leader>pr :!python %<CR>

nnoremap <leader>tc :tabclose<CR>

" }}}

" # General config {{{

" syntax highlight
syntax enable

" <3 UTF-8
set encoding=utf8

" Unix file format
set ffs=unix,dos,mac

" set leader
let mapleader=","

" indentation
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set textwidth=79

" line numer
set number

" show command bar
set showcmd

" highlight the current line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgrey
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" filetype specific indent file
filetype indent on

" visual auto complete
set wildmenu

" redraw only is needed
set lazyredraw

" highlight matxhing [{()}]
set showmatch

" split place
set splitbelow
set splitright

" cursor in the middle
set scrolloff=10

" No backup
set nobackup
set nowb
set noswapfile

" }}}

" # Searching {{{

" search dynamicly when typing
set incsearch

" highlight matches
set hlsearch

" ingnore case
set ignorecase
set smartcase
set magic

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" }}}

" # Folding {{{

" enable folding
set foldenable

" open some fold
set foldlevelstart=5

" max nested fold
set foldnestmax=10

" open/close fold with <space>
nnoremap <space> za

" fold based on indent level
set foldmethod=indent

 " }}}

" # Plug {{{

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlP'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'rust-lang/rust.vim', {'for': '*.rs'}
Plug 'tmhedberg/simpylfold'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json', {'for': '*.json'}
Plug 'plasticboy/vim-markdown', {'for': '*.md'}
Plug 'cespare/vim-toml', {'for': '*.toml'}
Plug 'lervag/vimtex', {'for': '*.tex'}
Plug 'jamessan/vim-gnupg'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
Plug 'robertbasic/vim-hugo-helper'
Plug 'valloric/youcompleteme'
call plug#end()

" }}}

" # Autogrop {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" }}}

  " # Plugins Config {{{

" ## SimpyFold {{{

" show docstring
let g:SimpylFold_docstring_preview=1

" }}}

" ## NERDTree {{{

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

" ## CtrlP {{{

let g:ctrlp_working_path_mode = 0

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" }}}

" ## Powerline {{{



" }}}

" ## vim-markdown {{{

set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" }}} 

" ## gnupg-vim {{{

let g:GPGPreferSign=1

" }}}

"  ## youcompleteme {{{

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
