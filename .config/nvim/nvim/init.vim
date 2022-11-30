" Author: Dal Williams (@dendrondal)
filetype off                  " required

" Airline" Removing vertical line from .py files
set cc=
"setup vim-plug {{{

  " Install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  " Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif

"}}}

" Load sources
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keybindings.vim

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

au BufNewFile,BufRead *.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set autoindent |
    \ set expandtab |

set encoding=utf-8
set smartindent

" Other QOL settings
set noerrorbells
set incsearch
set ignorecase
set smartcase
let g:sneak#label=1

" Linting
let g:ale_fixers = {
    \  '*': ['remove_trailing_lines', 'trim_whitespace'],
    \  'python': ['black', 'isort']
    \}
let g:ale_fix_on_save = 0
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

let g:coq_settings = {
	\ 'auto_start': v:true,
	\ 'display': {'icons': {'mappings': {
	\ 'Class': '',
	\ 'Module': '',
	\ 'TypeParameter': '',
	\ 'Value': '',
	\ 'Folder': '',
	\ 'Text': '',
	\ 'Function': 'λ',
	\ 'Method': 'λ',
	\ 'Constructor': 'λ'
	\}}}}
lua  <<  EOF
require'gitsigns'.setup()
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
local servers = {
	"pyright",
	"bashls",
	"omnisharp",
	"dockerls",
	"gopls",
	"jsonls",
}
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local lsp = vim.lsp
local coq = require "coq"
local saga = require "lspsaga"
saga.init_lsp_saga()
-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up servers, to avoid doing setting up a server twice.
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end
EOF


set completeopt-=preview

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

" Line numbers
set number relativenumber
set nu rnu

" Color adjustment
let g:airline_theme='wal'
colo wal

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_section_warning = 0
set laststatus=3
highlight WinSeparator guibg=None
set noshowmode
set ttimeoutlen=10
set t_RV=
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = '✘:'
let airline#extensions#ale#warning_symbol = '⚠:'

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

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

