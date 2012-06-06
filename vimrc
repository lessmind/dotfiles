call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" colorful
syntax on
" 256 color
set background=dark
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
set foldlevel=10
"set foldnestmax=3
set foldenable

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

" pdv
let g:pdv_cfg_Version = '0.0.1a'
let g:pdv_cfg_Author = 'nevermind'
let g:pdv_cfg_paste = 0

" unmapping
mapclear

" key mapping
" pdv
nmap <C-K> :call PhpDocSingle()<CR>
vmap <C-K> :call PhpDocRange()<CR>
" tabmapping
vmap <tab> >gv
vmap <BS> <gv
nmap <tab> v>
nmap <BS> v<
" nerd tree toggle
imap <F2> <esc> :NERDTreeToggle<CR>
vmap <F2> <esc> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
" tagbar toggle
nmap <F3> :TagbarToggle<CR><C-w>p
vmap <F3> <esc>:TagbarToggle<CR><C-w>p
imap <F3> <esc>:TagbarToggle<CR><C-w>p
" prev/next tab
nmap <C-left> gT
nmap <C-right> gt
imap <C-left> <esc>gT
imap <C-right> <esc>gt
vmap <C-left> <esc>gT
vmap <C-right> <esc>gt
" paste mode toggle
nmap <F7> :set paste!<BAR>set paste?<CR>
imap <F7> <esc>:set paste!<BAR>set paste?<CR>i
vmap <F7> <esc>:set paste!<BAR>set paste?<CR>
" prev/next all mark
nmap <S-F8> <Leader>?
nmap <S-F9> <Leader>/
" prev/next current mark
nmap <F8> <Leader>#
nmap <F9> <Leader>*
" prev/next match in vimgrep
nmap <C-up> :cp<CR>
nmap <C-down> :cn<CR>
