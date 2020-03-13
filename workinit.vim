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
" Plug 'wsdjeg/FlyGrep.vim' " project wise search
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tell-k/vim-autopep8'
Plug 'ludovicchabant/vim-gutentags' " tags
Plug 'jeetsukumaran/vim-pythonsense' " movements python
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree' "Undo tree history
Plug 'niklas-8/vim-darkspace'
Plug 'tell-k/vim-autoflake' "requires autoflake to be installed by pip
Plug 'dense-analysis/ale'
Plug 'mgedmin/python-imports.vim'
Plug 'liuchengxu/vim-clap'
Plug 'airblade/vim-gitgutter'
" Plug 'sbdchd/neoformat
Plug 'majutsushi/tagbar'
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
syntax enable
set guifont=DroidSansMono\ Nerd\ Font\ 11
let mapleader = ","
set showmatch
set incsearch "live matching"
set number
set relativenumber
set splitbelow
set splitright
set ruler
set laststatus=2 " display powerline on one window too
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set nopaste

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
scriptencoding utf-8
set wildignore=*.swp,*.bak,*.pyc,*.class
set history=100
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=Lo
set mouse=a
set noswapfile                    " it's 2013, Vim.

" make sure vim returns to same line on reopen file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

 "airline setups
let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
" theming
let g:airline_theme='darkspace'
" theming
let g:darkspace_italics=1
set background=dark
colorscheme darkspace

let python_highlight_all=1
syntax on

"autocmd BufWritePost *.py call flake8#Flake8()
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
set tags=tags
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim/gutentags'

nnoremap <leader>th :UndotreeToggle<cr>
nmap <leader>tt :TagbarToggle<CR>
" shcortcuts
noremap <leader>r :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd FileType python noremap <buffer> <leader>p8 :call Autopep8()<CR>
" vresize
noremap <silent> <C-S-Left> :vertical resize +15<CR>
noremap <silent> <C-S-Right> :vertical resize -15<CR>

noremap <leader>z <c-w>_ \| <c-w>\|
" zoom in
noremap <leader>o <c-w>=
" zoom out
"nnoremap <Leader>ps :FlyGrep<cr>
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

" autoflake8 setup
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:autoflake_disable_show_diff=1
autocmd FileType python map <buffer> <leader>af :call Autoflake()<CR>

" nerd tree shortcuts
nnoremap <silent> <Leader>v :call NerdTreeToggleFind()<CR>
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



function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

" }}}
" Highlight Word {{{
function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz
    normal! "zyiw
    let mid = 86750 + a:n
    silent! call matchdelete(mid)
    let pat = '\V\<' . escape(@z, '\') . '\>'
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
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

"select all lines
nnoremap gv V`]
"select charwise contents of current line excluding intendent
nnoremap vv ^vg_
let g:autopep8_on_save = 1
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>so :only<cr>
nnoremap <leader>in    :ImportName<CR>
nnoremap <leader>ih  :ImportNameHere<CR>
let g:ale_python_pylint_options = '--load-plugins pylint_django'

" vim clap
map <leader>ff :Clap files <CR>
map <leader>fg :Clap grep<CR>
set textwidth=80
au BufRead,BufNewFile *.py setlocal textwidth=80

"neoformat setup
" let g:neoformat_enabled_python = ['yapf', 'docformatter']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat! python yapf
" augroup END
"
set updatetime=250
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='┃'
let g:gitgutter_sign_removed_first_line='┃'
let g:gitgutter_sign_modified_removed='┃'
