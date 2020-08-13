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
" statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" PyWal integration
Plugin 'dylanaraps/wal.vim'
" Code folding
Plugin 'tmhedberg/SimpylFold'
" Python syntax goodies
Plugin 'vim-scripts/indentpython.vim'
Plugin 'fisadev/vim-isort'
Plugin 'vim-syntastic/syntastic'
" Python Intellisense
Bundle "Valloric/YouCompleteMe"
" Fancy searching
Plugin 'kien/ctrlp.vim'
" File manager
Plugin 'preservim/nerdtree'
" Awesome commenting
Plugin 'preservim/nerdcommenter'
" Object Inspection
Plugin 'majutsushi/tagbar'
" Distraction-free mode (bound to <leader>d)
Plugin 'junegunn/goyo.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
" Vim navigation for manpages
Plugin 'vim-utils/vim-man'
" FUBAR-proofing writing
Plugin 'mbbill/undotree'
" Fancier icons
Plugin 'ryanoasis/vim-devicons'

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

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
set smartindent
autocmd BufWritePost *.py :!isort %

" Python autocompletion & go to definition binding
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gf  :YcmCompleter FixIt<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>

let g:ycm_python_interpreter_path = "" 
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path',
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
syntax on
let g:ycm_always_populate_location_list = 0
let g:ycm_log_level = 'error'

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
set noshowmode
let g:airline#extensions#tabline#enabled = 1

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Key mappings
inoremap jk <ESC>
map <leader>f :NERDTreeToggle<CR>
map <leader>d :Goyo<CR>
map <leader>is :Isort<CR>
nnoremap <leader>sc :set spell!<CR>
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

" Tagbar
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Mouse disabling
set mouse =
set ttymouse=
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>

" Better backups & swap files
set directory=~/.vim/dirs/tmp
set backup
set backupdir=~/.vim/dirs/backups
set undofile
set undodir=~/.vim/dirs/undo
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" Other QOL settings
set noerrorbells
set incsearch
