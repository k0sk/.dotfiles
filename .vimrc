set encoding=utf-8
scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

" Leader
let g:mapleader="\<Space>"

" NeoBundle
" Initialization {{{1
if !1 | finish | endif
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'tools\\update-dll-mingw',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \   },
  \ }

" Display {{{1
" Colorschemes {{{2
NeoBundle 'w0ng/vim-hybrid', {
  \ 'autoload': {'commands': ['colorscheme']}}
NeoBundle 'nanotech/jellybeans.vim', {
  \ 'autoload': {'commands': ['colorscheme']}}
NeoBundle 'jpo/vim-railscasts-theme', {
  \ 'autoload': {'commands': ['colorscheme']}}
" Show indent level {{{2
NeoBundle 'Yggdroot/indentLine'
if has('conceal')
  let g:indentLine_char='¦'
  let g:indentLine_color_term=239
endif
" Customize status line {{{2
NeoBundle 'itchyny/lightline.vim'

" Utilities {{{1
" Substitute all {{{2
NeoBundle 'osyo-manga/vim-over'
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" Close text Objects with surrounds {{{2
NeoBundleLazy 'kana/vim-operator-user', {
  \ 'autoload': {'insert': 1}}
NeoBundleLazy 'rhysd/vim-operator-surround', {
  \ 'autoload': {'insert': 1}}
" Incremental search {{{2
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Filer {{{2
NeoBundle 'justinmk/vim-dirvish'
" File finder {{{2
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|app|so|swp|zip|tar.gz|jpg|png)$',
  \ }

" Automation {{{1
" Auto save {{{2
NeoBundleLazy 'syui/wauto.vim', {
  \ 'autoload': {'insert': 1}}
let g:auto_write = 1
" Auto close parentheses {{{2
NeoBundleLazy 'cohama/lexima.vim', {
  \ 'autoload': {'insert': 1}}
" Quick run {{{2
NeoBundleLazy 'thinca/vim-quickrun.git', {
  \ 'autoload': {'commands': ['QuickRun']}}
let g:quickhl_config = {'_': {'split': 'vertical'}}
nnoremap <leader>r :QuickRun<CR>
" Comment out quickly {{{2
NeoBundle 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
let g:NERDShutUp=1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle
" Easiy align {{{2
NeoBundle 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Completion {{{1
" neocomplete {{{2
NeoBundleLazy 'Shougo/neocomplete.vim', {
  \ 'autoload': {'insert': 1}}
" neosnippet {{{2
NeoBundleLazy 'Shougo/neosnippet.vim', {
  \ 'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet-snippets', {
  \ 'autoload': {'insert': 1}}

" Languages {{{1
" Ruby {{{2
NeoBundleLazy 'rails.vim', {
  \ 'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'tpope/vim-rails', {
  \ 'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'tpope/vim-rake', {
  \ 'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'tpope/vim-projectionist', {
  \ 'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'thoughtbot/vim-rspec', {
  \ 'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload': {'filetypes': ['ruby']}}
" Python {{{2
NeoBundleLazy 'davidhalter/jedi-vim', {
  \ 'autoload': {'filetypes': ['python']}}
" HTML {{{2
NeoBundleLazy 'lilydjwg/colorizer', {
  \ 'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'amirh/HTML-AutoCloseTag', {
  \ 'autoload': {'filetypes': ['html']}}
" Markdown {{{2
NeoBundleLazy 'mutewinter/vim-markdown', {
  \ 'autoload': {'filetypes': ['markdown']}}

" Tools {{{1
" Git {{{2
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rhysd/committia.vim'
" Grep {{{2
NeoBundle 'vim-scripts/grep.vim'
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
" Dictionary {{{2
NeoBundle  'itchyny/dictionary.vim'

" Reccomended {{{1
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'L9'
NeoBundleLazy 'unite.vim', {
\   'autoload': {'commands': ['Unite']}
\ }

" End of initialization {{{1
filetype plugin indent on
call neobundle#end()
NeoBundleCheck


runtime! userautoload/*.vim

" Modelines
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
