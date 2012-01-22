call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
colorscheme mango
set tags=./tags,tags
set nocompatible
set backspace=2
set shiftwidth=4
set tabstop=4
"set softtabstop=4
set ruler
set hlsearch
set incsearch
set cursorline
set ai
set cin
set foldmethod=indent
set foldlevel=5
vmap <tab> >gv
vmap <BS> <gv
nmap <tab> v>
nmap <BS> v<
imap <F2> <esc> :NERDTreeToggle<CR>
vmap <F2> <esc> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR><C-w>p
vmap <F3> <esc>:TagbarToggle<CR><C-w>p
imap <F3> <esc>:TagbarToggle<CR><C-w>p
nmap <F11> gT
nmap <F12> gt
imap <F11> <esc>gT
imap <F12> <esc>gt
vmap <F11> <esc>gT
vmap <F12> <esc>gt
nmap <F10> :set paste!<BAR>set paste?<CR>
vmap <F10> <esc>:set paste!<BAR>set paste?<CR>
set t_Co=256

if has("autocmd")
	filetype plugin indent on
endif
