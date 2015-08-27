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
NeoBundleLazy 'haya14busa/incsearch.vim', {
  \ 'autoload': {'mappings': '<Plug>(incsearch'}}
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Improved ft command {{{2
NeoBundleLazy 'chrisbra/improvedft', {
  \ 'autoload': {'insert': 1}}
" Filer {{{2
NeoBundle 'justinmk/vim-dirvish'
" File finder {{{2
NeoBundleLazy 'kien/ctrlp.vim', {
  \ 'autoload': {'commands': ['CtrlP']}}
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|app|so|swp|zip|tar.gz|jpg|png)$'
  \ }
if executable('ag')
  let g:ctrlp_use_caching=0
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
else
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command=['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings={
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>']}
endif
nnoremap <Leader>o :CtrlP<CR>
" Region expanding {{{2
NeoBundleLazy 'terryma/vim-expand-region', {
  \ 'autoload': {'insert': 1}}
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" Tiled window manager {{{2
NeoBundleLazy 'spolu/dwm.vim', {
  \ 'autoload': {'insert': 1}}
nmap <C-n> <Plug>DWMNew
nmap <C-c> <Plug>DWMClose
nmap <C-Space> <Plug>DWMFocus
nmap <C-l> <Plug>DWMGrowMaster
nmap <C-h> <Plug>DWMShrinkMaster
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
