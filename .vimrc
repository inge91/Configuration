" ===== Basic settings ===== "
set nocompatible
set incsearch
set nohlsearch
set nobackup
set guioptions=
set textwidth=80
set linebreak
set undodir=~/.vim/undodir
set undofile

" default indentation: 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" align at the same level when there's unclosed parenthesis, as in:
" foo(argument_1,
"     argument_2)
set cino=(0

syntax on

" ===== Appearance ===== "
colorscheme zenburn
set gfn=PragmataPro\ 10

" ===== NeoBundle plugin manager ===== "
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'xaviershay/tslime.vim'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'VimClojure'
NeoBundle 'LaTeX-Box'

NeoBundleCheck

filetype plugin indent on

" ===== Plugin settings ===== "

" bind the buftag plugin of CtrlP
noremap <C-p> :CtrlP<CR>
noremap <C-o> :CtrlPBufTag<CR>

" nerdtree and taglist toggle
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>

" gundo settings
nnoremap <F4> :GundoToggle<CR>

" clang_complete
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_close_preview = 1
