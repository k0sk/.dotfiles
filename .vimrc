set encoding=utf-8
scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

" Leader
let g:mapleader="\<Space>"

" Dein
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
set runtimepath+=~/.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

runtime! userautoload/*.vim

" Modelines
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
