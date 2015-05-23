set autoindent
set smartindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

augroup vimrc
  autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END
