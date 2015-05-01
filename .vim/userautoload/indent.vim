set autoindent
set smartindent

set shiftwidth=2
set tabstop=2
set expandtab

augroup vimrc
  autocmd FileType c setlocal shiftwidth=4 tabstop=4 expandtab
  autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 expandtab
  autocmd FileType py setlocal shiftwidth=4 tabstop=4 expandtab
  autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END
