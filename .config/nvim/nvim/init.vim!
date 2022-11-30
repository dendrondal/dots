" Author: Dal Williams (@dendrondal)
filetype off                  " required

" Remapping leader key for ambidexterity
nnoremap <SPACE> <Nop>
let mapleader =" "

"
" Airline" Removing vertical line from .py files
set cc=
"setup vim-plug {{{

  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif

"}}}
" Plugs
call plug#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plug 'gmarik/Vundle.vim'
	" statusline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Popup terminal
	Plug 'voldikss/vim-floaterm'
	" PyWal integration
	Plug 'dylanaraps/wal.vim'
	" Code folding
	Plug 'tmhedberg/SimpylFold'
	" Python syntax goodies
	Plug 'vim-scripts/indentpython.vim'
	Plug 'fisadev/vim-isort'
	Plug 'dense-analysis/ale'
	" Intellisense
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
	" Fancy searching
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'justinmk/vim-sneak'
	" File manager (NOTE: run :CHADdeps on install)
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
	" Awesome commenting
	Plug 'preservim/nerdcommenter'
	" Object Inspection
	Plug 'majutsushi/tagbar'
	" Distraction-free mode (bound to <leader>g)
	Plug 'junegunn/goyo.vim'
	" Writing integration for better md/rst linebreaks:
	Plug 'reedes/vim-pencil'
	" Tags for html/xml/rst:
        Plug 'tpope/vim-surround'
	" Indentation lines for yaml:
	Plug 'Yggdroot/indentline', {'for': 'yaml'}
	" Git integration
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	" Vim navigation for manpages
	Plug 'vim-utils/vim-man'
	" FUBAR-proofing writing
	Plug 'mbbill/undotree'
	" Fancier icons
	Plug 'ryanoasis/vim-devicons'


" All of your Plugs must be added before the following line

call plug#end()            " required
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


" Linting
let g:ale_fixers = {
    \  '*': ['remove_trailing_lines', 'trim_whitespace'],
    \  'python': ['black', 'isort']
    \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['pylint']}
let g:ale_python_black_options = '-S'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" COQ?

lua  <<  EOF
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{autostart =  true}
end
EOF
let g:coq_settings = {'auto_start': v:true}

" RST/MD tools
augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1})
    autocmd FileType rst call pencil#init({'wrap': 'soft', 'autoformat': 1})
augroup end

" Yaml tools
au BufNewFile,BufRead *.{yaml,yml}
    \ set filetype=yaml |
    \ setlocal ts=2 sts=2 sw=2 expandtab |
    \ set foldlevelstart=20 |
let g:indentLine_char_list = ['¦', '┆', '┊']

"" Line numbers
set number relativenumber
set nu rnu

" Color adjustment
colo wal
let g:airline_theme='wal'

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_section_warning = 0
set laststatus=2
set noshowmode
set ttimeoutlen=10
set t_RV=
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Key mappings
inoremap jk <ESC>
nmap <leader>q :close<CR>
vnoremap <leader>p "_dP<CR>
map <leader>f :CHADopen<CR>
map <leader>gg :GitGutterToggle<CR>
map <leader>is :Isort<CR>
nnoremap <leader>sc :set spell!<CR>
nnoremap <leader>u :UndotreeToggle<CR>

"Tabs and Splits {{{
"when opening files in splits/tabs, I first split the current buffer into a
"new vsplit/tab and then open the new file with whatever method suits me.
"Ctrl-\ opens a vsplit
"I remember this because shift-\ is | which looks like a vertical split.
nnoremap <C-\> :vsp<CR>
nnoremap <C-s> :split<CR>
"tab handling
nnoremap <leader>t :tab sp<CR>
nnoremap <leader>w :tabc<CR>
"buffer navigation
map H :bp<CR>
map L :bn<CR>
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

" Floating terminal
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Git gud: merge left and right screens after pressing `dv` while over file in
" fugitive.
nmap <leader>ml :diffget //2<CR>
nmap <leader>mr :diffget //3<CR>

" Tagbar
map <leader>v :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Telescope
nnoremap <silent> <leader>s :Telescope find_files<CR>
nnoremap <silent> <leader>g :Telescope live_grep<CR>
nnoremap <silent> <leader>/ :Telescope commands<CR>
nnoremap <silent> <C-g> :Telescope git_commits<CR>
nnoremap <silent> <C-f> :Telescope git_bcommits<CR>
nnoremap <silent> <leader>b :Telescope buffers<CR>

" Mouse disabling
set mouse =
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
set ignorecase
set smartcase
let g:sneak#label = 1
