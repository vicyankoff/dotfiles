" set vim to behave in a more vim like way
set nocompatible
filetype off

" see the line number
set number

" don't wrap lines
set nowrap

" set the runtime path to include Vuncle and initialize
set rtp+=~/dotfiles/.vim/bundle/Vundle.vim

" Vundle plugin start
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()
filetype plugin indent on

" load up NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd Vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" color theme
colorscheme desert

" number of spaces in a tab
set tabstop=4
set softtabstop=4
" size of an "indent"
set shiftwidth=4

" turn tabs into spaces
set expandtab

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" highlight search
set hlsearch

" enable incremental search highlighting
set incsearch

" turn off hex/octal detection when dealing with numbers
set nrformats=

" remember the last 200 commands
set history=200

" display status line
set laststatus=2

" enable case insensitive search
set ic

" enable case-sensitive search when uppercase letters show up in search phrase
set smartcase

" %:h will input thecurrent file's path, so :e %:h allows you to open another 
" file in the current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" allow for finding files in any subdirectiroes by default.
" :find and type the filename, vim will search in all subdirectories
set path+=./**

" up and down line wise instead of line-number wise
nmap j gj
nmap k gk

" start up pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" set powerline fonts
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" set configuragion for macvim
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

" * and # to search for the current selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" Remap the Leader key to be space
let mapleader = "\<Space>"

" <Space>w to save the file
nnoremap <Leader>w :w<CR>

" <Space>q to quit file
nnoremap <Leader>q :q!<CR>

" <Space>e to open NERDTree
nnoremap <Leader>e :NERDTree<CR>
" Enter visual mode with <Space><Space>
nmap <Leader><Leader> V
" toggle NERDTree visibility
nmap  <Leader>e :NERDTreeToggle<CR>

" color column 85
set colorcolumn=85

" save file on focus lost
au FocusLost * :wa

" Remap window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <Space>W to open vertical window
nnoremap <Leader>W <C-w>v<C-w>l

" edit new files without saving old ones
set hidden

" mute highlight when searching
nnoremap <silent> <C-l> :nohl<CR><C-l>
