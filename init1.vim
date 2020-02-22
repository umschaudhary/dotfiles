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

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" make sure vim returns to same line on reopen file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END



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
autocmd FileType python noremap <buffer> <leader>p8 :call Autopep8()<CR>
noremap <leader>z <c-w>_ \| <c-w>\| 
" zoom in 
noremap <leader>o <c-w>=
" zoom out
nnoremap <Leader>ps :FlyGrep<cr>
" project wise searching
" Copying/pasting text to the system clipboard.
noremap  <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y VV"+y
nnoremap <leader>Y "+y
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
" user sane regex
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
" leader space to clear matches
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_



" }}}
" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" command line shortcuts
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"select all lines
nnoremap gv V`]

"select charwise contents of current line excluding intendent
nnoremap vv ^vg_
