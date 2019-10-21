set nocompatible              " required
filetype off                  " required

" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
" Python folding
Plug 'tmhedberg/SimpylFold'
" Python auto-indent
Plug 'vim-scripts/indentpython.vim'
" Autocomplete
Plug 'davidhalter/jedi-vim'
" Virtualenv
Plug 'jmcantrell/vim-virtualenv'
" File manager
Plug 'scrooloose/nerdtree'
" Git
Plug 'tpope/vim-fugitive'
" Lint
Plug 'dense-analysis/ale'
" Tab autocomplete and more
Plug 'ervandew/supertab'
" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required ??
" ----------
" Encoding
set encoding=utf-8
" Enable syntax higlighting
syntax enable
" Copy to system (X11) clipboard (+ register)
" requires vim with clipboard support, had to install vim-gnome from apt
" vim --version | grep clipboard
set clipboard=unnamedplus
" Code folding
set foldmethod=indent
set foldlevel=99
" Flag unnessecary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Line numbers
set number
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
nnoremap <F5> :silent exec "!tmux send-keys -t 1 Up Enter"<cr>:redr!<cr>
" Format json in open file using python
nnoremap <C-j> :%!python -m json.tool<cr>

" Jedi conf
let g:jedi#popup_on_dot = 0
