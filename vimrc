call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
colorscheme inkpot
set tags=./tags,tags
set nocompatible
set backspace=2
set shiftwidth=4
set tabstop=4
"set softtabstop=4
set ruler
set hlsearch
set incsearch
"set cursorline
set ai
set cin
set foldmethod=indent
set foldlevel=5
vmap <tab> >gv
vmap <BS> <gv
nmap <tab> v>
nmap <BS> v<
imap <F2> <esc> :NERDTreeTabsToggle<CR>
vmap <F2> <esc> :NERDTreeTabsToggle<CR>
nmap <F2> :NERDTreeTabsToggle<CR>
nmap <F3> :TagbarToggle<CR><C-w>p
vmap <F3> <esc>:TagbarToggle<CR><C-w>p
imap <F3> <esc>:TagbarToggle<CR><C-w>p
set t_Co=256

if has("autocmd")
	filetype plugin indent on
endif
