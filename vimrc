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

" show percentage
set ruler

" search 
set hlsearch
set incsearch

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

" set iskeyword
set iskeyword-=-

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

" NeoComplCache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Omni Comletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" filetype
if has("autocmd")
	filetype on
	filetype plugin on
	filetype plugin indent on
endif

" pdv
"let g:pdv_cfg_Version = '0.0.1a'
let g:pdv_cfg_Author = 'ada@e-ipro.com'
"let g:pdv_cfg_paste = 0

" iskeyword
autocmd FileType php setlocal iskeyword+=$
autocmd FileType javascript setlocal iskeyword+=$
autocmd FileType css,sass,scss setlocal iskeyword+=-

" php syntax setting
let php_noShortTags=1
let php_parent_error_close=1
let php_parent_error_open=1
let php_htmlInStrings=1
let php_special_vars=1
let php_special_functions=1

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

" sudo
cmap sudow w !sudo tee >/dev/null %

" foldlevel
cmap sfl set foldlevel=

" snipmate
"let g:snips_author = ''
