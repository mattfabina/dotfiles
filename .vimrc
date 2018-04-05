set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

filetype plugin indent on

set noesckeys

" line numbers
set number
set relativenumber

" whitespace chars
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" tab -> 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let python_highlight_all=1
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree options
let NERDTreeShowHidden=1

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
map <F2> <Esc>:w<CR>:!python %:p<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 79 column guide
highlight ColorColumn ctermbg=3
call matchadd('ColorColumn', '\%81v', 100)
