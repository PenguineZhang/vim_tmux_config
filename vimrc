execute pathogen#infect()
call pathogen#helptags()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
call vundle#end()

syntax on
filetype plugin indent on
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd VimEnter * NERDTree

set whichwrap+=<,>,h,l,[,]
set pastetoggle=<F2>
set mouse=a
nmap <F12> : NERDTreeToggle<CR>
colorscheme dracula
highlight Comment cterm=bold
map <C-c> :s:^:#<CR>
map <C-x> :s:^#<CR>

