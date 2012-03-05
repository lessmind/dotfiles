call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" colorful
syntax on
" 256 color
set t_Co=256
colorscheme mango

" tags
set tags=./tags,tags

" disable compatible to vi
set nocompatible

" enable backspace
set backspace=2

" tab setting
set shiftwidth=4
set tabstop=4
"set softtabstop=4

set ruler

" search 
set hlsearch
set incsearch

set cursorline

" indent
set ai
set cin

" fold
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" key mapping
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

" syntastic
let g:syntastic_javascript_jshint_conf='~/.jshint.json'
let g:syntastic_mode_map = { 'mode': 'active',
						   \ 'active_filetypes': ['js', 'php', 'phtml']}

" NeoComplCache auto command
"autocmd FileType * NeoComplCacheEnable
"autocmd FileType * NeoComplCacheCachingTags
"autocmd FileType php NeoComplCacheCachingSyntax php
"autocmd FileType javascript NeoComplCacheCachingSyntax javascript
"autocmd FileType html NeoComplCacheCachingSyntax html
"autocmd FileType phtml NeoComplCacheCachingSyntax html

" filetype
if has("autocmd")
	filetype on
	filetype plugin on
	filetype plugin indent on
endif
