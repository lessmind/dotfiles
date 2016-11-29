" #######################################
"             Vim settings
" #######################################
"
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
let mapleader="m"

" no empty newlines at the end of files
set binary
set noeol

" colorful
syntax on

" mark trailing space
set list listchars=tab:\ \ ,trail:·

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
	" append iskeyword
	autocmd FileType php setlocal iskeyword+=$
	autocmd FileType javascript setlocal iskeyword+=$
	autocmd FileType css,sass,scss setlocal iskeyword+=-
	" change tab spacing
	"autocmd FileType css,sass,scss,php,javascript,html call SetSpaceIndent(4)
	"autocmd FileType ruby,eruby,python,yaml call SetSpaceIndent(2)
	" Omni completions
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
	" git
	autocmd BufNewFile,BufRead *.git/modules/**/COMMIT_EDITMSG set ft=gitcommit
endif

" fold
set foldenable
set foldmethod=indent
set foldlevel=10

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

" add tmux ^key shortcut support
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

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

" #######################################
"             Read other vim configs
" #######################################
"
" read vimrc extension
if filereadable($HOME."/.vimrc.ext")
	so $HOME/.vimrc.ext
endif
" read home local
if filereadable($HOME."/.vimrc.local")
	so $HOME/.vimrc.local
endif
" from current project local
if filereadable("./.vimrc.local")
	so ./.vimrc.local
endif