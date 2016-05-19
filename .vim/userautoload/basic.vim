" Display
set title
set number
set cursorline

" Status line
set laststatus=2
set showcmd

" Invisible chars
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" Line
set wrap
set textwidth=80
set colorcolumn=80

" Operation
set backspace=indent,eol,start
" set clipboard=unnamed,autoselect

" Parentheses
set matchpairs& matchpairs+=<:>
set whichwrap=b,s,h,s,<,>,[,],~

" Search
set smartcase
set wrapscan
set hlsearch
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" Timeout
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=100

" Encoding
set termencoding=utf-8
set fileencoding=utf-8
set fileformat=unix

" No Swap
set noswapfile
set nobackup
set nowritebackup

" Clean when Save
autocmd vimrc BufWritePre * :%s/\s\+$//e

" Netrw
let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'
let g:netrw_liststyle=3
let g:netrw_list_hide='^\._.*$,^\.DS_Store$'

" Modeline
set modeline
set modelines=3
