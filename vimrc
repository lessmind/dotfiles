" disable compatible to vi
set nocompatible

" call pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" encoding
set encoding=utf-8

" colorful
syntax on

" 256 color
set background=dark
set t_Co=256
colorscheme mango

" vars
let g:author_name=''

" tags
set tags=./tags,tags

" enable backspace
set backspace=2

" show percentage
set ruler

" search 
set hlsearch
set incsearch

" indent
set cin

" tab indent
set shiftwidth=4
set tabstop=4

" 2 space indent for ruby, eruby, python, yaml
function Set2SpaceIndent()
	setlocal tabstop=2
	setlocal softtabstop=2
	setlocal shiftwidth=2
	setlocal expandtab
endfunction
autocmd FileType ruby,eruby,python,yaml call Set2SpaceIndent()

" cursor line(tells which line you are)
set cursorline

" filetype
if has("autocmd")
	filetype on
	filetype plugin on
	filetype plugin indent on
endif

" fold
set foldenable
set foldmethod=indent
set foldlevel=10

" iskeyword
autocmd FileType php setlocal iskeyword+=$
autocmd FileType javascript setlocal iskeyword+=$
autocmd FileType css,sass,scss setlocal iskeyword+=-

" no actually close
set hidden

" backup dir
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.

" don't wrap lines
"set nowrap

" highlight matched parenthesis
"set showmatch

" change terminal title
"set title

" paste toggle in insert mode
set pastetoggle=<F7>

" status line
"set laststatus=2
"set statusline=%r\ %w%l:\ %m%F\ %y
set laststatus=2
set statusline=%r%m
set statusline+=%F\ 
set statusline+=\ %04l/%03c\ 
set statusline+=\ %Y\ 
set statusline+=\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\ 
set statusline+=\ %{&fenc!=''?&fenc:&enc}\ 
set statusline+=\ 0x%04.4B

" #############################################################
" read local setting specify in different machines or projects
" #############################################################
" from home
if filereadable($HOME."/.vimrc.local")
	so ${HOME}/.vimrc.local
endif
" from current directory
if filereadable("./.vimrc.local")
	so ./.vimrc.local
endif

" #######################################
"             Plugin Settings
" #######################################

" syntastic
let g:syntastic_javascript_jshint_conf='~/.jshint.json'
let g:syntastic_mode_map = { 'mode': 'active',
						   \ 'active_filetypes': ['js', 'php', 'phtml']}

" NeoComplCache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Omni Comletion(for NeoComplCache)
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" pdv
"let g:pdv_cfg_Version = '0.0.1a'
let g:pdv_cfg_Author=g:author_name
"let g:pdv_cfg_paste = 0

" snipmate
let g:snips_author=g:author_name
let g:snips_trigger_key='<C-J>'
let g:snips_trigger_key_backwards='<C-H>'
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['php'] = 'php' " prevent trigger other snippets in php

" php syntax setting
"let php_noShortTags=1
"let php_parent_error_close=1
"let php_parent_error_open=1
"let php_htmlInStrings=1
let php_special_vars=1
let php_special_functions=1

" #######################################
"             Key Mappings
" #######################################
"
" unmapping
mapclear

" ############ maps for build-in keys
" shortcut for open tag in new tab
nmap <C-h> <C-w>]<C-w>T

" tabmapping
vmap <tab> >gv
vmap <BS> <gv
nmap <tab> v>
nmap <BS> v<

" prev/next tab
nmap <C-left> gT
nmap <C-right> gt
imap <C-left> <esc>gT
imap <C-right> <esc>gt
vmap <C-left> <esc>gT
vmap <C-right> <esc>gt

" prev/next match in vimgrep
nmap <C-up> :cp<CR>
nmap <C-down> :cn<CR>

" sudo
cmap sudow w !sudo tee >/dev/null %

" foldlevel
cmap sfl set foldlevel=

" ############ maps for plugins
" pdv
nmap <C-K> :call PhpDocSingle()<CR>
vmap <C-K> :call PhpDocRange()<CR>

" nerd tree toggle
imap <F2> <esc> :NERDTreeToggle<CR>
vmap <F2> <esc> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>

" tagbar toggle
nmap <F3> :TagbarToggle<CR><C-w>p
vmap <F3> <esc>:TagbarToggle<CR><C-w>p
imap <F3> <esc>:TagbarToggle<CR><C-w>p

" prev/next all mark
nmap <S-F8> <Leader>?
nmap <S-F9> <Leader>/

" prev/next current mark
nmap <F8> <Leader>#
nmap <F9> <Leader>*
