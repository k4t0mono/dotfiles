" .vimrc
"
" KatoMono Enkeli <k4t0mono@gmail.com>

" # Leader shortcuts {{{

" set leader
let mapleader=","

" toggle gundo
"nnoremap <leade>u :GundoToggle<CR>

" }}}

" # Colors {{{

" syntax highlight
syntax enable

" }}}

" # Inentation {{{

" indentation
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set textwidth=79

" }}}

" # UI config {{{

" line numer
set number

" show command bar
set showcmd

" highlight the current line
"set cursorline

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

" }}}

" # Searching {{{

" search dynamicly when typing
set incsearch

" highlight matches
set hlsearch

" ingnore case
set ignorecase
set smartcase

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
Plug 'klen/python-mode', {'for': '*.py'}
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
call plug#end()

" }}}

" # Autogrop {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
"                \:call <SID>StripTrailingWhitespaces()
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

" }}}

" # Backup {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" <3 UTF-8
set encoding=utf8

" Unix file format
set ffs=unix,dos

"  }}}

" # Functions {{{

if has("autocmd")
        autocmd BufWritePre * :silent !mkdir -p %:p:h
end

" }}}

 " # Plugins Config {{{

" ## SimpyFold {{{

" show docstring
let g:SimpylFold_docstring_preview=1

" }}}

" ## python-mode {{{

" use python3 syntax
" let g:pymode_python = 'python3'

" }}}

" ## NERDTree {{{

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

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
let g:GPGPossibleRecipients=[
    \"KatoMono Enkeli (Stardust Being) <k4t0mono@gmail.com>",
    \"Matheus Branco Borella <dark.ryu.550@gmail.com>"
\]

" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
