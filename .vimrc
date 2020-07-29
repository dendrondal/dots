" Author: Dal Williams (@dendrondal)
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dylanaraps/wal.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" Fancy searning
Plugin 'kien/ctrlp.vim'
" File manager
Plugin 'preservim/nerdtree'
" Distraction-free mode (bound to <leader>d)
Plugin 'junegunn/goyo.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'vim-utils/vim-man'
Plugin 'mbbill/undotree'
Bundle 'valoric/YouCompleteMe'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
map <leader>[ za<CR>

" Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
set smartindent

" Python autocompletion & go to definition binding
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gf  :YcmCompleter FixIt<CR>

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers
set relativenumber

" Color adjustment
colo wal
let g:airline_theme='wal'
" Airline Settings
let g:airline_powerline_fonts = 1
set laststatus=2

" Key mappings
inoremap jk <ESC>
map <leader>f :NERDTreeToggle<CR>
map <leader>d :Goyo<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Mouse disabling
set mouse =
set ttymouse=

" Remapping leader key for ambidexterity
nnoremap <SPACE> <Nop>
let mapleader =" "
nnoremap <bslash> <space>

" Other QOL settings
set noerrorbells
set incsearch
