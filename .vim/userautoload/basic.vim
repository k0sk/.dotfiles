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
set clipboard=unnamed,autoselect

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
set timeoutlen=150
set ttimeoutlen=75

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

" Modeline
set modeline
set modelines=3
