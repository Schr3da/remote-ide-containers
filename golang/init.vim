call plug#begin('~/.vim/plugged')
   	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
	Plug 'rakr/vim-one'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

let g:netrw_liststyle = 1
let g:netrw_banner = 0
let g:go_def_mode='gopls'

set cmdheight=4
set laststatus=2
set ffs=unix,dos
set ff=unix
set number
set noswapfile
set spell spelllang=en_us
set completeopt=longest,menuone
set tabstop=2
set softtabstop=2
set shiftwidth=2 noexpandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set spell spelllang=en_us
set wildignore+=*/node_modules/*
set wildignore+=*/target/*
set wildignore+=*/dist/*
set wildmode=longest,list
set noet ci pi sts=0 sw=2 ts=2

colorscheme one
set background=dark

highlight Pmenu ctermbg=gray guibg=black cterm=NONE guibg=NONE gui=NONE guifg=NONE
highlight PmenuSel ctermbg=16 guibg=156 cterm=NONE guibg=NONE gui=NONE guifg=NONE

if has("gui_running")
	set guifont=Monospace\ 14
endif

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
