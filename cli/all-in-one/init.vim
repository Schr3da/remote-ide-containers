call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'rakr/vim-one'
  Plug 'fatih/vim-go'
  Plug 'OmniSharp/omnisharp-vim'  
  Plug 'groenewege/vim-less'
  Plug 'palantir/tslint'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'	
  Plug 'rust-lang/rust.vim'
  Plug 'timonv/vim-cargo'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
	Plug 'w0rp/ale'
call plug#end()

let g:netrw_liststyle = 1
let g:netrw_banner = 0
let g:go_def_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

let g:ale_echo_msg_error_str = 'E'    
let g:ale_echo_msg_warning_str = 'W'    
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'  

let g:ale_linters = {
	\ 'cs': ['OmniSharp']
\}

let mapleader=","

set cmdheight=1
set laststatus=2
set ffs=unix,dos
set ff=unix
set nowrap
set number
set noswapfile
set spell spelllang=en_us
set completeopt=longest,menuone
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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <space>dp <Plug>(coc-diagnostic-prev)
nmap <silent> <space>dn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <leader>ba :buffers<CR>
nmap <silent> <leader>bn :bnext<CR>
nmap <silent> <leader>bp :bprevious<CR>
nmap <silent> <leader>bb :b#<CR>
nmap <silent> <leader>ff :Rg<CR>
nmap <silent> <leader>fn :cn<CR>
nmap <silent> <leader>fp :cp<CR>

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <C-p> :Files<CR>
nnoremap <C-pg> :GitFiles<CR>
