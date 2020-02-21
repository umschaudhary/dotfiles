" execute pathogen#infect()
set nocompatible              " required
syntax on

filetype off                  " required
filetype plugin on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"generic programming
"
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'lambdalisue/vim-django-support'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'tobyS/vmustache'
Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'neomake/neomake'
Plugin 'mxw/vim-jsx'
Plugin 'jmcomets/vim-pony'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plugin 'Yggdroot/indentLine'


Plugin 'fisadev/vim-isort'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch' 

Plugin 'tmhedberg/SimpylFold'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'lepture/vim-jinja'
Plugin 'prettier/vim-prettier'
"auto completion
Plugin 'ervandew/supertab'
Plugin 'klen/rope-vim'
"js
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'plytophogy/vim-virtualenv'
"emmet
Plugin 'mattn/emmet-vim'
"color scheme
Plugin 'flazz/vim-colorschemes'
Plugin 'neutaaaaan/iosvkem'
"color sque
Plugin 'gko/vim-coloresque'
Plugin 'tpope/vim-surround'

"autopep8 
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
"add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"color scheme
colorscheme badwolf
set splitbelow
set autoread
set splitright
" set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let g:prettier#autoformat = 0
autocmd BufWritePre *.html,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" autocmd autopep8 

let g:autopep8_max_line_length=72
let python_highlight_all = 1
let g:user_emmet_leader_key='<C-y>'
set background=dark
set autoindent
set backspace=indent,eol,start
set expandtab
set ignorecase
set incsearch 
set laststatus=2
set linebreak 
set nobackup
set noerrorbells
set nolist
set noswapfile
set novb
set nowrap 
set number
set relativenumber
set ruler
set scrolloff=5
set showmatch 
set shiftwidth=4
set shortmess=I
set showcmd
set showmode
set sidescroll=1
set sidescrolloff=7
set smartcase
set softtabstop=4
set undolevels=10000
set nrformats-=octal

map <C-n> :NERDTreeToggle<CR>
"Gvim mods
set encoding=utf-8
scriptencoding utf-8
set hidden
set wildignore=*.swp,*.bak,*.pyc,*.class
set history=100

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=Lo
set mouse=a
let g:NERDTreeMouseMode=3
"nerd-commenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1


let NERDTreeMinimalUI = 1

let NERDTreeDirArrows = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"Enable simply fold

" Remove all trailing whitespace by pressing F4

noremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

let g:SimpylFold_docstring_preview = 1

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


if has("gui_running")
    set background=dark
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set foldmethod=indent
set foldlevel=99
nnoremap <space> za


" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1


autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']


let test#strategy = "vimux"

" Neocomplete Settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap jj <Esc>

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"autocmd FileType html,css EmmetInstall
"let g:user_emmet_settings = {
" \  'javascript.jsx' : {
" '   \      'extends' : 'jsx',
 " \  },
 "j \}

"auto call pep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ctrl + d for toggle bash 
noremap <C-d> :sh<cr>
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'evince'
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" let g:indentLine_char = '.'
"
"
