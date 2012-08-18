"""""""""""""""""""""""""""""""""""""""""""""""""""""""" Basic stuff


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nostartofline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on
syntax on

" set the tabwidth and spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4 " makes the spaces feel like real tabs

" great brace behaviour
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" colorscheme
"
set t_Co=256
colorscheme jellybeans

" ide-like in autocomplete functionality
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" set gvim font
set gfn=Terminus\ 11

" set no search highlighting
set nohlsearch

" omnicomplete
set ofu=syntaxcomplete#Complete

" no backup files
set nobackup

" remove most gui elements
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=e

" linebreaks and shit
set textwidth=80
set linebreak

" remap the space bar to <Leader>
nnoremap <SPACE> <Nop>
let mapleader=" ""

" remap <Leader>w to be like <Control>w for window controls
nnoremap <Leader>w <C-w>

" persistent undo
set undodir=~/.vim/undodir
set undofile





filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-powerline'

" vim-scripts repos
" Bundle 'FuzzyFinder'
Bundle "a.vim"

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...


" Enable file type detection.
filetype plugin indent on



""""""""""""""""""""""""""""""""""""""""""""""""" Plugin settings



" nerdtree and taglist toggle
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>

" gundo settings
nnoremap <F4> :GundoToggle<CR>

" powerline settings
let g:Powerline_symbols='compatible'
set laststatus=2 " Always show the statusline

" clang_complete
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/llvm/"
let g:clang_user_options = '|| exit 0'
