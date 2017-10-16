""" Global options

" enable vim features instead of strict vi compatibility
set nocompatible
" enable syntax highlighting
syntax on
" try to detect the filetype
filetype on
" enable loading the plugin file for specific file types
filetype plugin on
" enable loading the indent file for specific file types
filetype indent on
" show matching brackets and parens
set showmatch
" show 3 lines above or below cursor when scrolling
set scrolloff=3
" ignore case when searching
set ignorecase
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
" number of spaces to use for autoindenting
set shiftwidth=2
" how many columns vim uses when you hit Tab in insert mode
set softtabstop=2
" always set autoindenting on
set autoindent
" insert space characters whenever the tab key is pressed
set expandtab
" choose when to use tabs or spaces
set smarttab
"  set the text width for automatic word wrapping
set textwidth=80
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Enhanced completion hints in command line
set wildmenu
" Complete longest common match and show possible matches
set wildmode=list:longest,full
" Do lots of scanning on tab completion
set complete=.,w,b,u,U,t,i,d
" Show cursorline and column
set cursorline
set cc=+15
" Show line numbers
set number
" Display unprintable characters
set list
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
" In diff mode, ignore whitespace changes and align unchanged lines
set diffopt=filler,iwhite
" every window gets a status line
set laststatus=2
" It hides buffers instead of closing them.
set hidden
" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"  %    : saves and restores the buffer list
"  '100 : marks will be remembered for up to 30 previously edited files
"  /100 : save 100 lines from search history
"  h    : disable hlsearch on start
"  "500 : save up to 500 lines for each register
"  :1000 : up to 1000 lines of command-line history will be remembered
"  n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:1000,n~/.vim/viminfo
" Update deplay in ms
set updatetime=1000
" confugyre Undo
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif
 " Remember 1000 commands
set history=1000
" disable backups
set nobackup
set noswapfile
" Toggle paste
set pastetoggle=<F10>
" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql
" set leader to comma
let mapleader = ","
" local leader to backslash. (local leader is used for only specific file types)
let maplocalleader = "\\"
" clear search highlight
map <Leader>/ :nohlsearch<cr>
" up/down on displayed lines, not real lines. More useful than painful.
noremap j gj
noremap k gk
" After 4s of inactivity, check for external file modifications on next keyrpress
au CursorHold,WinEnter,TabEnter * checktime
