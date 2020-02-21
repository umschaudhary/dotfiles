" execute pathogen#infect()
set nocompatible              " required
syntax on
filetype off                  " required
filetype plugin on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plugin 'vim-syntastic/syntastic' " syntax check & highlighting
Plugin 'nvie/vim-flake8' " pep8 checking
Plugin 'jnurmine/Zenburn' "theming
Plugin 'altercation/vim-colors-solarized' " theming
Plugin 'scrooloose/nerdtree' "nerdtree
Plugin 'kien/ctrlp.vim' " ctrlp
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "powerline
Plugin 'wsdjeg/FlyGrep.vim' " project wise search
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kaicataldo/material.vim' "material theme 
Plugin 'hzchirs/vim-material' " another material themes
Plugin 'ryanoasis/vim-devicons'
Plugin 'tell-k/vim-autopep8'
Plugin 'jmcomets/vim-pony' " Django 
Plugin 'ludovicchabant/vim-gutentags' " tags
Plugin 'jeetsukumaran/vim-pythonsense' " movements python
" All of your Plugins must be added before the following line
call vundle#end()            " required
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
set autoindent
set backspace=indent,eol,start

let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material

let python_highlight_all=1
syntax on
" Enable folding
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
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

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

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
