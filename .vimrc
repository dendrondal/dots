" Author: Dal Williams (@dendrondal)
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Remapping leader key for ambidexterity
nnoremap <SPACE> <Nop>
let mapleader =" "

" Removing vertical line from .py files
set cc=

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
Plugin 'fisadev/vim-isort'
Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
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
    \ set softtabstop=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix |
    \ set cc= |

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
set smartindent

" Python autocompletion & go to definition binding
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gf  :YcmCompleter FixIt<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path',
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" Linting configuration
let g:ale_linters = {
  \  'python': ['flake8', 'pylint'],
  \}
let g:ale_fixers = {
  \  'python': ['yapf'],
  \}
let g:ale_fix_on_save = 1

" let python_highlight_all=1
" syntax on

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers
set number relativenumber
set nu rnu

" Color adjustment
colo wal
let g:airline_theme='wal'
" Airline Settings
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Key mappings
inoremap jk <ESC>
map <leader>f :NERDTreeToggle<CR>
map <leader>d :Goyo<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nmap <leader>X :close<CR>
" Git gud: merge left and right screens after pressing `dv` while over file in
" fugitive.
nmap <leader>ml :diffget //2<CR>
nmap <leader>mr :diffget //3<CR>

" Mouse disabling
set mouse =
set ttymouse=
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>


" Other QOL settings
set noerrorbells
set incsearch
