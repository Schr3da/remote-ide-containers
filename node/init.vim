call plug#begin('~/.vim/plugged')
   	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
	Plug 'rakr/vim-one'
	Plug 'groenewege/vim-less'
	Plug 'palantir/tslint'
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'	
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:netrw_liststyle = 1
let g:netrw_banner = 0

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

augroup tslint
  function! s:typescript_after(ch, msg)
    let cnt = len(getqflist())
    if cnt > 0
      echomsg printf('[Tslint] %s errors', cnt)
    endif
  endfunction
  let g:tslint_callbacks = {
    \ 'after_run': function('s:typescript_after')
    \ }

  let g:tsuquyomi_disable_quickfix = 1

  function! s:ts_quickfix()
    let winid = win_getid()
    execute ':TsuquyomiGeterr'
    call tslint#run('a', winid)
  endfunction

  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
  autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
augroup END

if has("gui_running")
	set guifont=Monospace\ 14
endif

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
