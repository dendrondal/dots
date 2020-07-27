" Author: Dal Williams (@dendrondal)
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ...
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Using plug
Plugin 'dylanaraps/wal.vim'

" All of your Plugins must be added before the following line
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Indentation
Plugin 'vim-scripts/indentpython.vim'
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax highlighting
Plugin 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab

" Fancy searching 
Plugin 'kien/ctrlp.vim'
" Line numbers
set nu

" Color adjustment
colo wal
let g:airline_theme='wal'
" Airline Settings
let g:airline_powerline_fonts = 1
set laststatus=2

" File Browser
Plugin 'preservim/nerdtree'
map <leader>f :NERDTreeToggle<CR>

" Distraction-free mode
Plugin 'junegunn/goyo.vim'
map <leader>d :Goyo<CR>

call vundle#end()            " required

" Mouse disabling
set mouse =
set ttymouse=

