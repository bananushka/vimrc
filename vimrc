set nocompatible " not compatible with vi

" Vundle {{{
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/CSApprox'
Bundle 'vim-scripts/Wombat'
" }}}

" Color-scheme {{{
set t_Co=256
set background=dark
colorscheme wombat
" }}}

" Tabs and indentation {{{
set expandtab " use spaces instead of tabs
set tabstop=2 " how wide a tab character will be displayed
set shiftwidth=2 " how many will be inserted by indentation (automatic or >>/<<)
set shiftround " '>' and '<' work in bulks of {shiftwidth}
set smarttab " in a beginning of a line, inserts tab-worth spaces when tab is pressed, and deletes as many on backspace
" }}}

" Filetypes and syntax {{{
syntax on " syntax highlighting
filetype plugin indent on " allows recognition of filetypes, loads appropriate plugins for filetype, and indentation rules
" }}}

" Map leaders {{{
let mapleader = ","
let maplocalleader = "."
" }}}

" Normal mode mappings {{{

" saving and quitting {{{{
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :wq!<cr>
nnoremap <leader>1q :q!<cr>
" }}}}

" buffer switching (and closing) {{{{
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprev<cr>
nnoremap <leader>c :close<cr>
" }}}}

" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G

" reload vimrc
nnoremap <leader>sv :wq<cr>:source $MYVIMRC<cr>

" get rid of old habits {{{{
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" }}}}

" faster command mode
nnoremap ; :
" }}}

" Insert mode mappings {{{

" easy way to leave insert-mode
inoremap jk <esc>

" get rid of old habits {{{{
inoremap <esc> <nop>
inoremap OA <nop>
inoremap OB <nop>
inoremap OC <nop>
inoremap OD <nop>
" }}}}
" }}}

" Operator mappings (movements) {{{

" inside parantheses {{{{
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
" }}}}

onoremap in@ :<c-u>execute "normal! ?\\S\\+@\\S\\+\r"<cr>
" }}}

" Page layout {{{
set number " line numbers
set so=7 " when possible, keep minimal distance of 7 lines between cursor and edge (top/bottom)
set laststatus=2
" }}}

" Search
set incsearch

" Buffers
set hidden " allow invisible, unsaved buffers

" Folding
set nofoldenable " by default, do not fold

" Abbreviations {{{
iabbrev #i #include
iabbrev func function
" }}}

" Auto-commands {{{

" HTML-related {{{{
augroup html_file
  autocmd!
  autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}}

" JS-related {{{{
augroup filetype_js
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END
" }}}}

" Python-related {{{{
augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}}

" C-related {{{{
augroup filetype_c
  autocmd!
  autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
augroup END
" }}}}

" Vim-related {{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim normal! zM
augroup END
" }}}}

" Markdown-related {{{{
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+\\\\|--\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+\\\\|--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}}
" }}}

" Status line {{{
set statusline=%f
set statusline+=%y
set statusline+=%=%02c-%03l/%03L
" }}}
