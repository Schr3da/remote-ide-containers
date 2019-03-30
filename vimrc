call plug#begin('~/.vim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'rakr/vim-one'
    Plug 'rust-lang/rust.vim'
    Plug 'timonv/vim-cargo'
    Plug 'racer-rust/vim-racer'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'maralla/completor.vim'
	Plug 'quramy/tsuquyomi'
    Plug 'leafgarland/typescript-vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'groenewege/vim-less'
    Plug 'w0rp/ale'
    Plug 'kien/ctrlp.vim'
call plug#end()

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_search_term_min_length = 3
let g:typescript_indent_disable = 1
let g:completor_racer_binary = '~/.cargo/bin/racer'
let g:completor_gocode_binary = '~/.go-packages/bin/gocode'
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_echo_cursor = 0
let g:netrw_liststyle = 3
let g:netrw_banner = 0

set laststatus=2
set ffs=unix,dos
set ff=unix
set number
set noswapfile
set spell spelllang=en_us
set completeopt=longest,menuone
set shiftwidth=4 noexpandtab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set spell spelllang=en_us
set wildignore+=*/node_modules/*
set wildignore+=*/target/*
set wildignore+=*/dist/*
set wildmode=longest,list

syntax on
silent! colorscheme onedark

