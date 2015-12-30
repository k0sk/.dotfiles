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
" Netrw {{{2
let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'
let g:netrw_liststyle=3
let g:netrw_list_hide='^\._.*$,^\.DS_Store$'
" Substitute all {{{2
NeoBundle 'osyo-manga/vim-over'
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" Close text Objects with surrounds {{{2
NeoBundleLazy 'rhysd/vim-operator-surround', {
  \ 'autoload': {'insert': 1},
  \ 'depends': ['kana/vim-operator-user']}
" Incremental search {{{2
NeoBundleLazy 'haya14busa/incsearch.vim', {
  \ 'autoload': {'mappings': '<Plug>(incsearch'}}
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Improved ft command {{{2
NeoBundleLazy 'chrisbra/improvedft', {
  \ 'autoload': {'insert': 1}}
" File finder {{{2
NeoBundleLazy 'ctrlpvim/ctrlp.vim', {
  \ 'autoload': {'commands': ['CtrlP']}}
nnoremap <Leader>o :CtrlP<CR>
" Region expanding {{{2
NeoBundleLazy 'terryma/vim-expand-region', {
  \ 'autoload': {'insert': 1}}
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" Tiled window manager {{{2
NeoBundleLazy 'spolu/dwm.vim', {
  \ 'autoload': {'mappings': ['<Plug>DWM']}}
nmap <C-n> <Plug>DWMNew
nmap <C-c> <Plug>DWMClose
nmap <C-@> <Plug>DWMFocus
nmap <C-l> <Plug>DWMGrowMaster
nmap <C-h> <Plug>DWMShrinkMaster
" Automation {{{1
" Auto save {{{2
NeoBundleLazy 'syui/wauto.vim', {
  \ 'autoload': {'insert': 1}}
let g:auto_write = 1
" Auto close parentheses {{{2
" NeoBundleLazy 'cohama/lexima.vim', {
  " \ 'autoload': {'insert': 1}}
NeoBundleLazy 'seletskiy/vim-autosurround', {
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
NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {'mappings': '<Plug>(EasyAlign'}}
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
" Syntax check {{{2
NeoBundleLazy 'osyo-manga/vim-watchdogs', {
  \ 'autoload': {'insert': 1},
  \ 'depends': ['thinca/vim-quickrun', 'osyo-manga/shabadou.vim',
  \             'cohama/vim-hier', 'dannyob/quickfixstatus']}
" Language pack {{{2
NeoBundle 'sheerun/vim-polyglot'
" C++ {{{2
NeoBundleLazy 'osyo-manga/vim-marching', {
  \ 'autoload': {'filetypes': ['cpp', 'c'], 'insert': 1},
  \ 'depends': ['Shougo/vimproc.vim']}
let g:marching_clang_command='clang'
let g:marching_include_paths=['/usr/include/c++', '/usr/local/include/c++']
let g:marching_enable_neocomplete=1
" let g:marching_backend='sync_clang_command'
" Lisp {{{2
NeoBundleLazy 'kovisoft/slimv', {
  \ 'autoload': {'filetypes': ['lisp'], 'insert': 1}}
let g:slimv_swank_cmd='!osascript -e "tell application \"iTerm\"" -e "tell the first terminal" -e "set vimsession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "write text \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\"" -e "end tell" -e "select vimsession" -e "end tell" -e "end tell"'
let g:lisp_rainbow=1
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
" Python {{{2
NeoBundleLazy 'davidhalter/jedi-vim', {
  \ 'autoload': {'filetypes': ['python']}}
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
" HTML {{{2
NeoBundleLazy 'lilydjwg/colorizer', {
  \ 'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'amirh/HTML-AutoCloseTag', {
  \ 'autoload': {'filetypes': ['html'], 'insert': 1}}
" Markdown {{{2
NeoBundleLazy 'mutewinter/vim-markdown', {
  \ 'autoload': {'filetypes': ['markdown']}}

" Tools {{{1
" Git {{{2
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rhysd/committia.vim'
" Grep {{{2
NeoBundleLazy 'vim-scripts/grep.vim', {
  \ 'autoload': {'commands': ['Rgrep']}}
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
" Gtags {{{2
NeoBundleLazy 'gtags.vim', {
  \ 'autoload': {'commands': ['Gtags']}}
" Dictionary {{{2
NeoBundleLazy 'itchyny/dictionary.vim', {
  \ 'autoload': {'commands': ['Dictionary']}}
nnoremap <Leader>d :Dictionary<CR>
" AOJ {{{2
NeoBundleLazy 'mopp/AOJ.vim', {
  \ 'autoload': {'commands': ['AOJSubmit', 'AOJSubmitByProblemID',
  \                           'AOJViewProblems', 'AOJViewStatisticsLogs']},
  \ 'depends': ['Shougo/unite.vim', 'mattn/webapi-vim']}
let g:aoj#user_id='kosk'

" Reccomended {{{1
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping=0
nmap s <Plug>(easymotion-s2)
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
