set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'JamshedVesuna/vim-markdown-preview'

filetype plugin indent on

" line numbers
set number

" whitespace chars
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" tab -> 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree options
let NERDTreeShowHidden=1

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
map <F2> <Esc>:w<CR>:!python %:p<CR>
