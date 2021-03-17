set syntax
set number
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set updatetime=50
set colorcolumn=80
set nowrap

call plug#begin('~/.vim/plugged')

" Dracula!
Plug 'arcticicestudio/nord-vim' 


" LSP!
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'tweekmonster/gofmt.vim'
Plug 'rust-lang/rust.vim'

" TEEEEEJ
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Better lua syntax highlighting
Plug 'euclidianAce/BetterLua.vim'

" Devicons!
Plug 'kyazdani42/nvim-web-devicons'

Plug 'BurntSushi/ripgrep'

" Statusline!
Plug 'itchyny/lightline.vim'

call plug#end()


colorscheme nord 
let g:lightline = {
\'colorscheme': 'nord',
\ }

highlight comment cterm=italic 

let mapleader = " "

" Sane window movement
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>

nnoremap <leader><ENTER> :so ~/.config/nvim/init.vim<cr>

set completeopt=menuone,noinsert,noselect

nnoremap <leader>vd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>vs :lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>od :lua vim.lsp.diagnostic.get_line_diagnostics()<cr>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua vim.lsp.set_log_level("debug")

" Netrw
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_dirhistmax = 0

" Treesitter
lua require'nvim-treesitter.configs'.setup{ highlight = { enable = true } } 

lua require('plugin/lspconfig')
lua require('plugin/treesitter')


fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//
    call winrestview(l:save)
endfun
