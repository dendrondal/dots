call plug#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plug 'gmarik/Vundle.vim'
	" Less clunky mksession
	Plug 'tpope/vim-obsession'
	" statusline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" PyWal integration
	Plug 'dylanaraps/wal.vim'
	" Python syntax goodies
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'dense-analysis/ale'
	Plug 'tami5/lspsaga.nvim'
	" Intellisense
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
	" Fancy searching
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'justinmk/vim-sneak'
	" File manager
	Plug 'preservim/nerdtree'
	" Awesome commenting
	Plug 'preservim/nerdcommenter'
	" Object Inspection
	Plug 'majutsushi/tagbar'
	" Distraction-free mode
	Plug 'junegunn/goyo.vim'
	" Writing integration for better md/rst linebreaks:
	Plug 'reedes/vim-pencil'
	" Tags for html/xml/rst:
        Plug 'tpope/vim-surround'
	" Indentation lines for yaml:
	Plug 'Yggdroot/indentline', {'for': 'yaml'}
	" Git integration
	Plug 'tpope/vim-fugitive'
	Plug 'lewis6991/gitsigns.nvim'
	" Vim navigation for manpages
	Plug 'vim-utils/vim-man'
	" FUBAR-proofing writing
	Plug 'mbbill/undotree'
	" Fancier icons
	Plug 'ryanoasis/vim-devicons'


" All of your Plugs must be added before the following line

call plug#end()            " required
filetype plugin indent on    " required
