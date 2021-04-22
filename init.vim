" execute pathogen#infect()

" set the runtime path to include Vundle and initialize
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto suggestion
Plug 'scrooloose/nerdtree' "nerdtree file explorer
Plug 'preservim/nerdcommenter' " file explorer 
Plug 'kien/ctrlp.vim' " ctrlp file explorer
Plug 'tpope/vim-fugitive' " git integration
Plug 'wsdjeg/FlyGrep.vim' " project wise search
Plug 'Xuyuanp/nerdtree-git-plugin' "git integration on nerd tree
Plug 'ryanoasis/vim-devicons' " icons
Plug 'tell-k/vim-autopep8' "python auto pep8 formatting
Plug 'ludovicchabant/vim-gutentags' " ctags/ gutentags
Plug 'vim-airline/vim-airline' "airline theme
Plug 'terryma/vim-multiple-cursors' "multi cursors
Plug 'tpope/vim-surround'  " vim brackets 
Plug 'mbbill/undotree' "Undo tree history
Plug 'niklas-8/vim-darkspace' "theme
Plug 'tell-k/vim-autoflake' "remove duplicate imports
Plug 'mgedmin/python-imports.vim' " import in runtime
" Plug 'dense-analysis/ale' " auto suggestions
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } " vim fuzzy finder window
Plug 'airblade/vim-gitgutter' " git status on runtime
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'stephpy/vim-yaml'
Plug 'mattn/emmet-vim' " auto tag finder
Plug 'frazrepo/vim-rainbow'
Plug 'w0rp/ale'
Plug 'fatih/vim-go'
" Plug 'kiteco/vim-plugin'
"All of your Plugins must be added before the following line
call plug#end()            " required

" --- Functions --------------------------


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


function! ToggleMouse() abort
  if &mouse==#""
    set mouse=n
    echo "mouse on"
  else
    set mouse=
    echo "mouse off"
  endif
endfunction

function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction


" ---------------- General Settings ------------------

" filetype plugin indent on    " required
syntax enable
set nocompatible              " required
filetype off                  " required
filetype plugin on


set showmatch
set incsearch "live matching"
set number
set relativenumber
set splitbelow
set splitright
set noruler
set laststatus=2 " display powerline on one window too
" set smartindent
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
set nobackup
set nowritebackup
set nocursorline
set spelllang=en_us
set list
set listchars=tab:▸\ ,trail:▫,nbsp:_,extends:»,precedes:«

" wrap lines visually
set nowrap
set linebreak
set showbreak=↳

" wrap lines visually
set nowrap
set linebreak
set showbreak=↳

" set cmdheight=2
set updatetime=1000
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" diagnostics appear/become resolved.
set signcolumn=yes
scriptencoding utf-8

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=Lo
set mouse=a
set scrolloff=5
set noswapfile                    " it's 2013, Vim.
set clipboard=unnamedplus
" make sure vim returns to same line on reopen file
"
"  ---- Indentatin --------
set cinoptions=g0,l1,i0

" ---- Autocommand ---------------------

augroup custom_term
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" ---- Wildmenu ------------------------

set wildmenu
set wildignorecase
set wildmode=full
set wildignore=*.o,*.obj,*~
set wildignore+=*.swp,*.tmp,*.bak
set wildignore+=*.mp3,*.mp4,*mkv
set wildignore+=*.bmp,*.gif,*ico,*.jpg,*.png
set wildignore+=*.pdf,*.doc,*.docx,*.ppt,*.pptx
set wildignore+=*.rar,*.zip,*.tar,*.tar.gz,*.tar.xz

" map leader
let mapleader = ","

" toggle
nnoremap <silent> <leader>th :set hlsearch!<bar>set hlsearch?<cr>
nnoremap <silent> <leader>tm :call ToggleMouse()<cr>
nnoremap <silent> <leader>tp :set paste!<cr>
nnoremap <silent> <leader>ts :setlocal spell!<bar>setlocal spell?<cr>
nnoremap <silent> <leader>te :term<cr>i<c-\><c-n>i
nnoremap <silent> <leader>tw :set wrap!<bar>set wrap?<cr>
nnoremap <F5> :UndotreeToggle<cr>

nnoremap <silent> <Leader>v :call NerdTreeToggleFind()<CR>

" reload vimrc
nnoremap <silent> <leader>r :so $MYVIMRC<cr>

" git
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gr :Gread<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>hs :GitGutterStageHunk<cr>
nnoremap <silent> <leader>hu :GitGutterUndoHunk<cr>
nnoremap <silent> <leader>hp :GitGutterPreviewHunk<cr>

" autoflake8 setup
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:autoflake_disable_show_diff=1

" split resizes
noremap <silent> <C-S-Left> :vertical resize +15<CR>
noremap <silent> <C-S-Right> :vertical resize -15<CR>
nnoremap <silent> <C-S-Down> :resize -3<CR>
nnoremap <silent> <C-S-UP> :resize +3<CR>

" airline setups
if (has('termguicolors'))
  set termguicolors
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let airline#extensions#tabline#show_buffers = 0
let g:airline_theme='darkspace'

let python_highlight_all=1
syntax on

" theming
let g:darkspace_italics=1
colorscheme darkspace




" Nerd Tree
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

" autopep8 settings
autocmd FileType python map <buffer> <leader>af :call Autoflake()<CR>
autocmd FileType python noremap <buffer> <leader>p8 :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1

" remove trailing
noremap <leader>as :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" gutentags
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js','*.pyc','.git','.idea']
let g:gutentags_cache_dir = '~/.vim/gutentags'
set tags=tags


" zoom in
noremap <leader>z <c-w>_ \| <c-w>\|
noremap <leader>o <c-w>=


" project wise searching
nnoremap <Leader>ps :FlyGrep<cr>


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
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap jj <Esc>

" line move up or down
nnoremap <leader>s :m+<CR>
nnoremap <leader>w :m-2<CR>
inoremap <leader>w <Esc>:m-2<CR>
inoremap <leader>s <Esc>:m+<CR>



" jump to defination
map <silent> <leader>jd :CtrlPTag<cr><c-\>w
map <silent> <leader>je :CtrlPBuffer<cr><c-\>w

" auto completion selection with ta
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


"linting
let g:ale_python_pylint_options = '--load-plugins pylint_django'

" import helper
map <leader>in  :ImportName<CR>
map <leader>ih  :ImportNameHere<CR>

" vim clap
map <leader>ff :Clap files <CR>
map <leader>fg :Clap grep<CR>
map <leader>fb :Clap buffers<CR>


" ---- Gitgutter -----------------------

set updatetime=250
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='┃'
let g:gitgutter_sign_removed_first_line='┃'
let g:gitgutter_sign_modified_removed='┃'

" set transparent


hi Normal guibg=NONE ctermbg=NONE

function! Toggle_transparent()
    let t:is_transparent=1
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <leader>ts : call Toggle_transparent()<CR>

" kite setup
"set completeopt+=menuone
"let g:kite_tab_complete=1
" set completeopt-=preview
" nmap <silent> <leader>ks :KiteShowPopularPatterns<CR>
" nmap <silent> <leader>kh :KiteHidePopularPatterns<CR>
" set belloff+=ctrlg
" set completeopt+=noinsert
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P

"text width
set textwidth=80
au BufRead,BufNewFile *.py setlocal textwidth=80
" gq to reformat after selection 
"
" tag bar setup
nmap <leader>tt :TagbarToggle<CR>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.css,*.scss setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.json setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2

let g:user_emmet_leader_key=','

" colored brackets
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" ale for js
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1


" go configs
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0


let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

