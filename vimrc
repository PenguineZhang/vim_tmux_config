set nocompatible              " be iMproved, required
set exrc
set noswapfile
set nobackup
set encoding=utf-8
set incsearch
set noshowmode

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jremmen/vim-ripgrep'
Plugin 'scrooloose/nerdtree'
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:moll/vim-node.git'
Plugin 'morhetz/gruvbox'
Plugin 'hotoo/jsgf.vim'
Plugin 'git@github.com:ajh17/VimCompletesMe.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'lyuts/vim-rtags'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jacoborus/tender.vim'
Plugin 'tomasr/molokai'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vim-airline/vim-airline'
Plugin 'mbbill/undotree'

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
set nowrap
set autochdir " sets the cwd to whatever file is in view.  This allows better
              " omni completion.
autocmd BufWritePre * %s/\s\+$//e

" I am the best
set hidden

" nerdtree
let NERDTreeMinimalUI = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

" Let definitions
let mapleader= " "
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ag_working_path_mode="r"

" For simple sizing of splits.
map - <C-W>-
map + <C-W>+

" Remaps.  _his is where the magic of vim happens
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>u :UndotreeShow<CR>
nmap <silent>; :
nmap <leader>pf :CtrlP<CR>
nnoremap <Leader>gd :GoDef<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <silent> <Leader>vr :vertical resize 30<CR>
nnoremap <silent> <Leader>r+ :vertical resize +5<CR>
nnoremap <silent> <Leader>r- :vertical resize -5<CR>
nnoremap <silent> <Leader>;; iif err != nil { <esc>o} <esc>:w<CR>
nmap <leader><leader> V
vmap <Leader>y "+y
vmap <Leader>= <C-W><C-=>

" YCM
" The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" RG
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
nnoremap \ :Rg<SPACE>

