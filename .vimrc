set nocompatible

let base16colorspace = 256

" Ctrlp config
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set path=$PWD/** " Set the path to the initial directory

set scrolloff=5
set ignorecase
set smartcase
set clipboard=unnamed

filetype off " Required for Vundle

" Plugin preferences
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'	" Required
Plugin 'chriskempson/base16-vim' " Colors

" Syntax plugins
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-liquid'
Plugin 'lepture/vim-jinja'
au BufNewFile,BufRead *.nunjucks,*.nunjs,*.njk,*.nunj set ft=jinja

set number      " Show line numbers
set relativenumber
syntax enable   " Use syntax highlighting
set background=dark
colorscheme base16-eighties

Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-smooth-scroll' " Smooth scrolling
Plugin 'rking/ag.vim' " Project search
Plugin 'w0rp/ale' " Better linting
Plugin 'terryma/vim-multiple-cursors' " Multiple cursors

" ALE config
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" Show filename in status bar
set statusline+=%F

filetype plugin indent on " Required for Vundle

" Startup items
" autocmd vimenter * NERDTree

" User preferences
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Not sure what this is?
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Smooth scrolling preferences
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 25, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 25, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 25, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 25, 4)<CR>

" Clear search highlighting on esc
nnoremap <esc> :noh<return><esc>

" Map esc to escape terminal mode in neovim
tnoremap <Esc> <C-\><C-n>

set splitbelow
set splitright

" JSX highlighting fix
hi Tag        ctermfg=04
hi xmlTag     ctermfg=04
hi xmlTagName ctermfg=04
hi xmlEndTag  ctermfg=04

