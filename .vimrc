set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" Python folding
Plugin 'tmhedberg/SimpylFold'
" Python auto-indent
Plugin 'vim-scripts/indentpython.vim'
" Autocomplete
Plugin 'davidhalter/jedi-vim'
" Virtualenv
Plugin 'jmcantrell/vim-virtualenv'
" Syntax checker
"Plugin 'vim-syntastic/syntastic'
" Python backend for 'syntastic'
"Plugin 'nvie/vim-flake8'
" File manager
Plugin 'scrooloose/nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------
" Encoding
set encoding=utf-8
" Enable syntax higlighting
syntax enable
" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Code folding
set foldmethod=indent
set foldlevel=99
" Flag unnessecary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Python
" PEP 8 indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Shortcuts
" Run last command in other tmux pane, eg. python %
" nnoremap <F5> :silent exec "!tmux send-keys -t 1 '!!' Enter"<cr>:redr!<cr>
nnoremap <F5> :silent exec "!tmux send-keys -t 1 Up Enter"<cr>:redr!<cr>
