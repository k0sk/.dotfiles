set autoindent
set smartindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd vimrc FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd vimrc FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd vimrc FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd vimrc FileType yaml setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd vimrc FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
