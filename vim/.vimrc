""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""
set nocompatible
"set number
set title
set ruler
set hls
set showcmd
set incsearch

syntax on
"colorscheme desert
set laststatus=2
au InsertEnter * hi StatusLine ctermbg=1
au InsertLeave * hi StatusLine ctermbg=0

set autowrite
set autoread
"set autochdir
set diffopt=vertical

""""""""""""""""""""""""""""""""""""""
"INCIDENT SETTING
""""""""""""""""""""""""""""""""""""""
set cindent shiftwidth=2
set autoindent
"hitting Tab in insert mode will produce the appropriate number of spaces
set expandtab
"set autoindent shiftwidth=2

set softtabstop=8
"set shiftwidth=4
"set tabstop=4

" au BufRead,BufNewFile ?akefile set noexpandtab
" au BufRead,BufNewFile ?akefile set shiftwidth=4
" au BufRead,BufNewFile ?akefile set tabstop=4
"Remove whitespace
autocmd BufWritePre *.py,*.yml,*.am,*.ac,*.bb,*.cpp,*.c,*.cc,*.h,*.hh,*.java,*.dox :%s/\s\+$//e

