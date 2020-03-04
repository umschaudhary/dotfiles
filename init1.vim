" execute pathogen#infect()
set nocompatible              " required
syntax on
filetype off                  " required
filetype plugin on
" set the runtime path to include Vundle and initialize
call plug#begin()

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree' "nerdtree
Plug 'preservim/nerdcommenter'
Plug 'kien/ctrlp.vim' " ctrlp
Plug 'tpope/vim-fugitive' " git integration
Plug 'wsdjeg/FlyGrep.vim' " project wise search
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tell-k/vim-autopep8'
Plug 'ludovicchabant/vim-gutentags' " tags
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree' "Undo tree history
Plug 'niklas-8/vim-darkspace'
Plug 'tell-k/vim-autoflake'
Plug 'mgedmin/python-imports.vim'
"Plug 'dense-analysis/ale'
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
"set ruler
set laststatus=2 " display powerline on one window too
set smartindent
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
set scrolloff=5
set noswapfile                    " it's 2013, Vim.
set clipboard=unnamedplus
" make sure vim returns to same line on reopen file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" autoflake8 setup
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:autoflake_disable_show_diff=1
noremap <silent> <C-S-Left> :vertical resize +15<CR>
noremap <silent> <C-S-Right> :vertical resize -15<CR>

" airline setups
if (has('termguicolors'))
  set termguicolors
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let airline#extensions#tabline#show_buffers = 0
let g:airline_theme='darkspace'
" theming
let g:darkspace_italics=1
set background=dark
colorscheme darkspace

let python_highlight_all=1
syntax on
" ale setup
" syntax check pylint
autocmd FileType python map <buffer> <leader>af :call Autoflake()<CR>
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

let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim/gutentags'
" seting undo directories
" shcortcuts
nnoremap <F5> :UndotreeToggle<cr>
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

nnoremap <silent> \1 :call HiInterestingWord(1)<cr>
nnoremap <silent> \2 :call HiInterestingWord(2)<cr>
nnoremap <silent> \3 :call HiInterestingWord(3)<cr>
nnoremap <silent> \4 :call HiInterestingWord(4)<cr>
nnoremap <silent> \5 :call HiInterestingWord(5)<cr>
nnoremap <silent> \6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

"select all lines
nnoremap gv V`]
"select charwise contents of current line excluding intendent
nnoremap vv ^vg_
" hi Normal guibg=NONE ctermbg=NONE

map <leader>in    :ImportName<CR>
map <leader>ih  :ImportNameHere<CR>
