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
""set expandtab
""set tabstop=4
""set shiftwidth=4
""set softtabstop=4 " makes the spaces feel like real tabs

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

" persistent undo
set undodir=~/.vim/undodir
set undofile

" align at the same level when there's unclosed parenthesis, as in:
" foo(argument_1,
"     argument_2)
set cino=(0

" better autocomplete feeling
set completeopt=longest,menuone
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Vundle
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
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-sleuth'
Bundle 'kien/ctrlp.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'majutsushi/tagbar'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'xaviershay/tslime.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'Shougo/neocomplcache'

" vim-scripts repos
" Bundle 'FuzzyFinder'
Bundle 'VimClojure'
Bundle 'LaTeX-Box'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...


" Enable file type detection.
filetype plugin indent on



" colorscheme
"
colorscheme Tomorrow-Night

if has('gui_running')
    colorscheme Tomorrow-Night
endif

" set gvim font
set gfn=Cousine\ 9



""""""""""""""""""""""""""""""""""""""""""""""""" Plugin settings

" bind the buftag plugin of CtrlP
noremap <C-p> :CtrlP<CR>
noremap <C-o> :CtrlPBufTag<CR>

" nerdtree and taglist toggle
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>

" gundo settings
nnoremap <F4> :GundoToggle<CR>


" clang_complete
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/llvm"
let g:clang_user_options = '|| exit 0'

let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_close_preview = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
