" execute pathogen#infect()
set nocompatible              " required
syntax on
filetype off                  " required
filetype plugin on
" set the runtime path to include Vundle and initialize
call plug#begin()

" Plugin 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'vim-syntastic/syntastic' " syntax check & highlighting
"Plug 'neomake/neomake'
Plug 'nvie/vim-flake8' " pep8 checking
Plug 'scrooloose/nerdtree' "nerdtree
Plug 'kien/ctrlp.vim' " ctrlp
Plug 'tpope/vim-fugitive' " git integration
Plug 'wsdjeg/FlyGrep.vim' " project wise search
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kaicataldo/material.vim' "material theme 
"Plug 'hzchirs/vim-material' " another material themes
Plug 'ryanoasis/vim-devicons'
Plug 'tell-k/vim-autopep8'
Plug 'jmcomets/vim-pony' " Django 
Plug 'ludovicchabant/vim-gutentags' " tags
Plug 'jeetsukumaran/vim-pythonsense' " movements python
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
syntax enable
let mapleader = ","
set showmatch
set incsearch "live matching"
set number
set relativenumber
set splitbelow
set splitright
set ruler
set laststatus=2 " display powerline on one window too
" set autoindent
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" diagnostics appear/become resolved.
set signcolumn=yes
scriptencoding utf-8
set wildignore=*.swp,*.bak,*.pyc,*.class
set history=100
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=Lo
set mouse=a
" airline setups
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='molokai'
" theming
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material

let python_highlight_all=1
syntax on

" syntax check pylint
autocmd BufWritePost *.py call flake8#Flake8()
" Enable folding
let g:NERDTreeMouseMode=3
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTrimTrailingWhitespace = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

set clipboard=unnamedplus

let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim/gutentags'


" shcortcuts
noremap <leader>r :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd FileType python noremap <buffer> <leader>p :call Autopep8()<CR>
noremap <leader>z <c-w>_ \| <c-w>\| 
" zoom in 
noremap <leader>o <c-w>=
" zoom out
nnoremap <Leader>ps :FlyGrep<cr>
" project wise searching

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" navigation
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap jj <Esc>

nnoremap <leader>w :m-2<CR>
nnoremap <leader>s :m+<CR>
inoremap <leader>w <Esc>:m-2<CR>
inoremap <leader>s <Esc>:m+<CR>

" fold
nnoremap <leader><space> za

" nerd tree shortcuts
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
nnoremap <silent> <Leader>m :NERDTreeMirror<CR>
map <leader>n :NERDTreeToggle<CR>
"Gvim mods
map <silent> <leader>jd :CtrlPTag<cr><c-\>w
map <silent> <leader>je :CtrlPBuffer<cr><c-\>w
let g:autopep8_disable_show_diff=1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
nnoremap <silent> <esc> :noh<cr><esc>
