set nocompatible

filetype plugin indent on

set noesckeys

" search highlighting
set hlsearch

" line numbers
set number
set relativenumber

" whitespace chars
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" tab -> 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
map <F2> <Esc>:w<CR>:!python %:p<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 79 column guide
highlight ColorColumn ctermbg=3
call matchadd('ColorColumn', '\%81v', 100)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language-specific settings (mostly tabs/spaces)
let python_highlight_all=1
syntax on

autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
