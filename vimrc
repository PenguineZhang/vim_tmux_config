execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd VimEnter * NERDTree

set whichwrap+=<,>,h,l,[,]
set pastetoggle=<F2>
set mouse=a
nmap <F12> : NERDTreeToggle<CR>
colorscheme molokai
highlight Comment cterm=bold
map <C-c> :s:^:#<CR>
map <C-x> :s:^#<CR>

