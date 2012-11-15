" #######################################
"             Vim settings
" #######################################
" disable compatible to vi
set nocompatible

" set completion way
set wildmenu

" set quickfix list open in tab
set switchbuf=usetab

" ?
set ttyfast

" encoding utf8 & without bomb
set encoding=utf-8 nobomb

" change <Leader>
let mapleader=","

" no empty newlines at the end of files
set binary
set noeol

" colorful
syntax on

" 256 color
set background=dark
set t_Co=256

" tags
set tags=./tags,tags

" enable backspace
set backspace=2

" show percentage
set ruler

" show current mode
set showmode

" search
set hlsearch
set incsearch

" indent
set cin

" tab indent
set shiftwidth=4
set tabstop=4

" cursor line(tells which line you are)
set cursorline

" autocmds
if has("autocmd")
	filetype on
	filetype plugin on
	filetype plugin indent on
	" auto set markdown filetypes
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
	autocmd BufNewFile,BufRead *.{conf} set filetype=conf
endif

" no actually close
set hidden

" backup dir
set backupdir=~/.vim/backup,.
set directory=~/.vim/swaps,.
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" paste toggle in insert mode
set pastetoggle=<F7>

" status line
set laststatus=2

" #######################################
"             Load plugins
" #######################################
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
colorscheme mango

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
nmap <C-up> :silent cp<CR>
nmap <C-down> :silent cn<CR>

" sudo save
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" ############ maps for plugins
" nerd tree toggle
imap <F2> <esc> :NERDTreeMirrorToggle<CR>
vmap <F2> <esc> :NERDTreeMirrorToggle<CR>
nmap <F2> :NERDTreeMirrorToggle<CR>

" prev/next all mark
nmap <S-F8> <Leader>?
nmap <S-F9> <Leader>/

" prev/next current mark
nmap <F8> <Leader>#
nmap <F9> <Leader>*

" read vimrc extension
if filereadable($HOME."/.vimrc.ext")
	so ${HOME}/.vimrc.ext
endif
