" Key mappings
" Remapping leader key for ambidexterity
nnoremap <SPACE> <Nop>
let mapleader =" "
inoremap jk <ESC>
nmap <leader>q <cmd>close<CR>
vnoremap <leader>p "_dP<CR>
nnoremap <leader>sc <cmd>set spell!<CR>
nnoremap <leader>u <cmd>UndotreeToggle<CR>
nnoremap <leader>sr <cmd>source ~/.config/nvim/init.vim<CR>
" LSP commands
nnoremap <silent> gd <cmd>lua lsp.vim.buf.definition()<CR>
nnoremap <silent> gr <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gn <cmd>Lspsaga rename<CR>
nnoremap <silent> gs <cmd>Lspsaga signature_help<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

"splits
nnoremap <C-\> <cmd>vsp<CR>
nnoremap <C-s> <cmd>split<CR>
"tab handling
nnoremap <C-t> <cmd>tab sp<CR>
nnoremap <C-w> <cmd>tabc<CR>
"buffer navigation
map H <cmd>bp<CR>
map L <cmd>bn<CR>
" ArrowKeys = resize active split
nnoremap <silent><right> <cmd>wincmd <<CR>
nnoremap <silent><left> <cmd>wincmd ><CR>
nnoremap <silent><down> <cmd>wincmd +<CR>
nnoremap <silent><up> <cmd>wincmd -<CR>
"move between splits
nnoremap <silent><Tab>h <cmd>wincmd h<CR>
nnoremap <silent><Tab>j <cmd>wincmd j<CR>
nnoremap <silent><Tab>k <cmd>wincmd k<CR>
nnoremap <silent><Tab>l <cmd>wincmd l<CR>
nnoremap <silent><C-right> <cmd>wincmd H<CR>
nnoremap <silent><C-left> <cmd>wincmd L<CR>
nnoremap <silent><C-down> <cmd>wincmd J<CR>
nnoremap <silent><C-up> <cmd>wincmd K<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"}}}

" Floating terminal
nnoremap <silent> <F12> <cmd>Lspsaga open_floaterm<CR>
tnoremap <silent> <F12> <cmd>Lspsaga close_floaterm<CR>

" Git gud: merge left and right screens after pressing `dv` while over file in
" fugitive.
nmap <leader>ml <cmd>diffget //2<CR>
nmap <leader>mr <cmd>diffget //3<CR>

" Tagbar
map <leader>v <cmd>TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Telescope
nnoremap <silent> <leader>f <cmd>Telescope find_files<CR>
nnoremap <silent> <leader>g <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>/ <cmd>Telescope commands<CR>
nnoremap <silent> <C-g> <cmd>Telescope git_commits<CR>
nnoremap <silent> <C-f> <cmd>Telescope git_bcommits<CR>
nnoremap <silent> <leader>b <cmd>Telescope buffers<CR>

" NERDTree
map <leader>t <cmd>NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit = "v"
let g:NERDTreeMapOpenSplit = "s"
