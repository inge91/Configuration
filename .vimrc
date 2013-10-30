" ===== Basic mettings ===== "
set nocompatible
set incsearch
set nohlsearch
set nobackup
set guioptions=
set textwidth=80
set linebreak
set undodir=~/.vim/undodir
set undofile

" default indentation: 2 spaces
" in existing files, indentation is set by the vim-sleuth plugin
set expandtab
set shiftwidth=2

" make the autocomplete match the longest substring, and display even if there's
" only one match
set completeopt=longest,menuone

" align at the same level when there's unclosed parenthesis, as in:
" foo(argument_1,
"     argument_2)
set cino=(0

syntax on

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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'LaTeX-Box'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

NeoBundleCheck

filetype plugin indent on


" ===== Appearance ===== "
set background=dark
colorscheme ir_black
set gfn=Terminus\ 12


" ===== Plugin settings ===== "

" CtrlP
noremap <C-p> :CtrlP<CR>
noremap <C-o> :CtrlPBufTag<CR>

" nerdtree and taglist toggle
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>

" clang_complete
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_close_preview = 1

" lightline settings
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
