set nocompatible

let base16colorspace = 256

" Ctrlp config
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set path=$PWD/** " Set the path to the initial directory

set scrolloff=5
set ignorecase " Better searching
set smartcase " Better searching
set clipboard=unnamed " Unified clipboard

filetype off " Required for Vundle

" Plugin preferences
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'	" Required
Plugin 'chriskempson/base16-vim' " Colors
Plugin 'vim-airline/vim-airline' " Status bar
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'

" Syntax plugins
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-liquid'

" Nunjucks syntax
Plugin 'lepture/vim-jinja'
au BufNewFile,BufRead *.nunjucks,*.nunjs,*.njk,*.nunj set ft=jinja

" Misc preferences
set number      " Show line numbers
set relativenumber
syntax enable   " Use syntax highlighting
set background=dark
colorscheme base16-eighties
set cursorline

Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-smooth-scroll' " Smooth scrolling
Plugin 'rking/ag.vim' " Project search
Plugin 'w0rp/ale' " Better linting
Plugin 'terryma/vim-multiple-cursors' " Multiple cursors

" ALE config
let g:ale_sign_error = '❗'
let g:ale_sign_warning = '❔'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn
highlight LineNr ctermfg=DarkGrey ctermbg=None

filetype plugin indent on " Required for Vundle

" User preferences
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Simplify pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Smooth scrolling preferences
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

" Center search results
nnoremap n nzz
nnoremap N Nzz

" Clear search highlighting on esc
nnoremap <esc> :noh<return><esc>

" Change search highlighting colors
highlight Search ctermfg=LightCyan ctermbg=DarkGray

" Split on bottom and right by default
set splitbelow
set splitright

" JSX highlighting fix
hi Tag        ctermfg=04
hi xmlTag     ctermfg=04
hi xmlTagName ctermfg=04
hi xmlEndTag  ctermfg=04

" Trailing whitespace cleanup
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
