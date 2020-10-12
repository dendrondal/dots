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
Plugin 'dense-analysis/ale'
" Python Intellisense
Plugin 'ycm-core/YouCompleteMe'
" Fancy searching
Plugin 'kien/ctrlp.vim'
Plugin 'justinmk/vim-sneak'
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
    \ set textwidth=80 |
    \ set autoindent |
    \ set fileformat=unix |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |

set encoding=utf-8
set smartindent

" Intellisense
" Python autocompletion & go to definition binding
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gf  :YcmCompleter FixIt<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>

let g:ycm_python_binary_path = 'python'
let g:ycm_always_populate_location_list = 0
let g:ycm_log_level = 'error'

" Linting
let g:ale_fixers = {
    \  '*': ['remove_trailing_lines', 'trim_whitespace'],
    \  'python': ['black', 'isort']
    \}
let g:ale_linters = {
    \  'python': ['flake8', 'pylint']
    \}
let g:ale_fix_on_save = 1

" Line numbers
set number relativenumber
set nu rnu

" Color adjustment
colo wal
let g:airline_theme='wal'

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode
set t_RV=

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Key mappings
inoremap jk <ESC>
map <leader>f :NERDTreeToggle<CR>
map <leader>g :Goyo<CR>
map <leader>is :Isort<CR>
nnoremap <leader>sc :set spell!<CR>
nnoremap <leader>u :UndotreeToggle<CR>
"Tabs and Splits {{{
"when opening files in splits/tabs, I first split the current buffer into a
"new vsplit/tab and then open the new file with whatever method suits me.

"Ctrl-\ opens a vsplit
"I remember this because shift-\ is | which looks like a vertical split.
nnoremap <C-\> :vsp<CR>
"tab handling
nnoremap <leader>t :tab sp<CR>
nnoremap <leader>w :tabc<CR>

"Ctrl-Shift-ArrowKeys = resize active split
nnoremap <C-h> :wincmd <<CR>
nnoremap <C-l> :wincmd ><CR>
nnoremap <C-j> :wincmd +<CR>
nnoremap <C-k> :wincmd -<CR>

"move between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"}}}
nmap <leader>q :close<CR>
" Git gud: merge left and right screens after pressing `dv` while over file in
" fugitive.
nmap <leader>ml :diffget //2<CR>
nmap <leader>mr :diffget //3<CR>

" Tagbar
map <leader>d :TagbarToggle<CR>
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
let g:sneak#label = 1
