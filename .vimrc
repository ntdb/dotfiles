set nocompatible
filetype off " Required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Required
Plugin 'chriskempson/base16-vim' " Colors
Plugin 'vim-airline/vim-airline' " Status bar
Plugin 'vim-airline/vim-airline-themes'

" Syntax plugins
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-liquid'
Plugin 'lepture/vim-jinja'
Plugin 'elixir-editors/vim-elixir'

" Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plugin 'junegunn/fzf' " Fuzzy finder
Plugin 'scrooloose/nerdtree' " File tree
Plugin 'terryma/vim-smooth-scroll' " Smooth scrolling
Plugin 'rking/ag.vim' " Project search
Plugin 'w0rp/ale' " Better linting
Plugin 'terryma/vim-multiple-cursors' " Multiple cursors
Plugin 'haya14busa/incsearch.vim' " Highlight all search matches while typing
Plugin 'Raimondi/delimitMate' " Auto-close
Plugin 'tpope/vim-rhubarb' " Github integration
Plugin 'tpope/vim-fugitive' " Git
Plugin 'osyo-manga/vim-anzu' " Search status in airline

call vundle#end()
filetype plugin indent on " Required for Vundle

" Ctrlp config
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set path=$PWD/** " Set the path to the initial directory

set scrolloff=5
set ignorecase " Better searching
set smartcase " Better searching
set clipboard=unnamed " Unified clipboard

" Syntax
let g:airline_theme='base16_eighties'
au BufNewFile,BufRead *.nunjucks,*.nunjs,*.njk,*.nunj set ft=jinja

" Airline config
let g:airline_section_y = ''

" Misc preferences
set number      " Show line numbers
set relativenumber
set background=dark
colorscheme base16-eighties
syntax enable   " Use syntax highlighting
set nocursorline

" ALE config
let g:ale_sign_error = '❗'
let g:ale_sign_warning = '❔'
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn
highlight LineNr ctermfg=DarkGrey ctermbg=None

" User preferences
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" FZF Happiness
nnoremap <C-p> :FZF<CR>

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

" Highlight all search results while typing
map / <Plug>(incsearch-forward)

" NERDTree config
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Change search highlighting colors
" highlight Search ctermfg=LightCyan ctermbg=DarkGray
highlight CursorLine term=reverse cterm=reverse ctermbg=DarkGray
highlight Visual term=reverse cterm=reverse ctermbg=DarkGray
highlight IncSearch ctermfg=Black ctermbg=White
highlight Search term=reverse cterm=NONE ctermfg=Gray ctermbg=White

" Fix weirdness
highlight clear CursorLineNR

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

" Get base16 working properly
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
