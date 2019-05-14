call plug#begin('~/.vim/plugged')
 	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 	Plug 'junegunn/fzf.vim'
	Plug 'rakr/vim-one'
	Plug 'groenewege/vim-less'
  Plug 'OmniSharp/omnisharp-vim'  
  Plug 'w0rp/ale'
call plug#end()

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:netrw_liststyle = 1
let g:netrw_banner = 0
let g:ale_echo_msg_error_str = 'E'    
let g:ale_echo_msg_warning_str = 'W'    
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'  

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

let mapleader=","

set cmdheight=2
set laststatus=2
set ffs=unix,dos
set ff=unix
set nowrap
set number
set noswapfile
set completeopt=longest,menuone
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
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

function! LinterStatus() abort    
    let l:counts = ale#statusline#Count(bufnr(''))    
    
    let l:all_errors = l:counts.error + l:counts.style_error    
    let l:all_non_errors = l:counts.total - l:all_errors    
    
    return l:counts.total == 0 ? 'OK' : printf(    
    \   '%dW %dE',    
    \   all_non_errors,    
    \   all_errors    
    \)    
endfunction    

set statusline=%{LinterStatus()}

filetype plugin on
set completeopt=longest,menuone,preview
set previewheight=5
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
