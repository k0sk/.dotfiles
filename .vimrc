set encoding=utf-8
scriptencoding utf-8

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
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
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
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'
" Incremental search {{{2
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Filer {{{2
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|swp|zip)$',
  \ }

" Automation {{{1
" Auto save {{{2
NeoBundle 'syui/wauto.vim'
let g:auto_write = 1
" Auto close parentheses {{{2
NeoBundle 'Townk/vim-autoclose'
" Quick run {{{2
NeoBundleLazy 'thinca/vim-quickrun.git', {
\   'autoload': {'commands': ['QuickRun']}
\ }
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
NeoBundle 'Shougo/neocomplete.vim'
" neosnippet {{{2
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

" Languages {{{1
" Ruby {{{2
NeoBundleLazy 'rails.vim'
NeoBundleLazy 'tpope/vim-rails'
NeoBundleLazy 'tpope/vim-rake'
NeoBundleLazy 'tpope/vim-projectionist'
NeoBundleLazy 'thoughtbot/vim-rspec'
NeoBundleLazy 'tpope/vim-endwise'
" Python {{{2
NeoBundleLazy 'davidhalter/jedi-vim'
" HTML {{{2
NeoBundleLazy 'lilydjwg/colorizer'
NeoBundleLazy 'amirh/HTML-AutoCloseTag'
" Markdown {{{2
NeoBundleLazy 'mutewinter/vim-markdown'

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
