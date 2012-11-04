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
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" colorscheme
"
colorscheme Tomorrow-Night

if has('gui_running')
    colorscheme smyck
endif

" set gvim font
set gfn=DejaVu\ Sans\ Mono\ 10

" set no search highlighting
set nohlsearch

" omnicomplete
set ofu=syntaxcomplete#Complete
"set completeopt=longest,menuone

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
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/tabular'
Bundle 'Shougo/neocomplcache'
Bundle 'osyo-manga/neocomplcache-clang_complete'
Bundle 'kien/rainbow_parentheses.vim'

" vim-scripts repos
" Bundle 'FuzzyFinder'
Bundle 'a.vim'
Bundle 'mayansmoke'
Bundle 'VimClojure'

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
let g:clang_library_path = "/usr/lib/"
let g:clang_user_options = '|| exit 0'

let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_close_preview = 1

" neocomplcache
"
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" tab complete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" use neocomplcache & clang_complete
" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1

" add clang_complete option
let g:clang_complete_auto=1
