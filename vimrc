set nocompatible              " be iMproved, required
set exrc
set noswapfile
set nobackup
set nowritebackup
set encoding=utf-8
set incsearch
set noshowmode
set nomodeline
set rnu
syntax on

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()


" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plugin 'jremmen/vim-ripgrep'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'morhetz/gruvbox'
Plugin 'hotoo/jsgf.vim'
Plugin 'valloric/youcompleteme'
Plugin 'lyuts/vim-rtags'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() }}
Plugin 'junegunn/fzf.vim'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'tpope/vim-fugitive'
Plugin 'jacoborus/tender.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vim-airline/vim-airline'
Plugin 'mbbill/undotree'
Plugin 'vim-python/python-syntax'
Plugin 'bogado/file-line'
Plugin 'Tabmerge'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set of basic vim options
colorscheme gruvbox
set noerrorbells
set vb t_vb=
set background=dark
set undodir=~/.vim/undodir
set undofile
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set autochdir " sets the cwd to whatever file is in view.  This allows better
              " omni completion
set whichwrap+=<,>,h,l,[,]
set pastetoggle=<F2>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufReadPost *.launch set syntax=xml

" I am the best
set hidden

" Python syntax highlight
let g:python_highlight_all=1

" nerdtree
let NERDTreeMinimalUI = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

" ale settings
let g:ale_fixers = {'python': ['prettier']}
let g:ale_linters = {'python': ['pylint']}
nmap <c-j> :ALENext<CR>
nmap <c-k> :ALEPrevious<CR>


" Let definitions
let mapleader=" "
let g:ag_working_path_mode="r"

" For simple sizing of splits.
map - <C-W>-
map = <C-W>+
map + :vertical resize +5<CR>
map _ :vertical resize -5<CR>

" FZF file finder mapping
nnoremap <silent> <C-p> :FZF -m<CR>

" NERDcommenter mapping
" toggle comment
vmap <C-_> <leader>c<space>
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters={ 'c': {'left': '//', 'right': ''} }
let g:NERDUsePlaceHolders=0
let g:NERDSpaceDelims=1

" Remaps.  _his is where the magic of vim happens
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>u :UndotreeShow<CR>
nmap <silent>; :
nnoremap <Leader>gd :GoDef<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <silent> <Leader>vr :vertical resize 30<CR>
nnoremap <silent> <Leader>;; iif err != nil { <esc>o} <esc>:w<CR>
nmap <leader><leader> V
vmap <Leader>y "+y
vmap <Leader>= <C-W><C-=>


" Allow cursor movements during insert mode
inoremap <C-e> <end>
inoremap <C-a> <home>

" YCM
" The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" RG
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
nnoremap \ :Rg<SPACE>

" change cursor shape in different modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

