set encoding=utf-8
scriptencoding utf-8

" Options {{{1
" Display {{{2
set title
set number
set cursorline
" Status line {{{3
set laststatus=2
set showcmd
" Invisible chars {{{3
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" Line {{{3
set wrap
set textwidth=80
set colorcolumn=80
" Indentation {{{3
set autoindent
set smartindent

" Operation {{{2
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set matchpairs& matchpairs+=<:>
set whichwrap=b,s,h,s,<,>,[,],~
" Search {{{3
set smartcase
set wrapscan
set hlsearch
nmap <silent> <ESC><ESC> :nohlsearch<CR>
" ESC {{{3
set timeout
set timeoutlen=150
set ttimeoutlen=75

" File {{{2
" Encoding {{{3
set termencoding=utf-8
set fileencoding=utf-8
set fileformat=unix
" No Swap {{{3
set noswapfile
set nobackup
set nowritebackup
" Modeline {{{3
set modeline
set modelines=3


" NeoBundle {{{1
" Initialization {{{2
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

" Display {{{2
" Colorschemes {{{3
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'tomasr/molokai'
NeoBundle 'ciaranm/inkpot'
" Show indent level with space {{{3
if has('conceal')
  NeoBundle 'Yggdroot/indentLine'
  let g:indentLine_char='¦'
  let g:indentLine_color_term=239
endif
" Customize status line {{{3
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [['mode', 'paste'], ['fugitive', 'filename']]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

" Utilities {{{2
" Substitute all {{{3
NeoBundle 'osyo-manga/vim-over'
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" Grep {{{3
NeoBundle 'vim-scripts/grep.vim'
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
" VimShell {{{3
NeoBundle 'Shougo/vimshell.vim'
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> ,is :VimShell<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" Dictionary {{{3
NeoBundle  'itchyny/dictionary.vim'
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" Close text Objects with surrounds {{{3
NeoBundle 'kana/vim-operator-user' " dependency
NeoBundle 'rhysd/vim-operator-surround'
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
" Incremental search {{{3
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Highlight the selected word {{{3
NeoBundle 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
" Explore files and directories {{{3
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer=1
" Extended f, F key mapping {{{3
NeoBundle 'rhysd/clever-f.vim'
" Fuzzy file, buffer.. {{{3
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|swp|zip)$',
  \ }

" Automation {{{2
" Auto save {{{3
NeoBundle 'syui/wauto.vim'
let g:auto_write = 1
" Auto close parentheses {{{3
NeoBundle 'Townk/vim-autoclose'
" Quick run {{{3
NeoBundle 'thinca/vim-quickrun.git'
let g:quickhl_config = {'_': {'split': 'vertical'}}
nnoremap <leader>r :QuickRun<CR>
" Comment out quickly {{{3
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
let NERDShutUp=1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
" Easiy align {{{3
NeoBundle 'junegunn/vim-easy-align'

" Completion {{{2
" neocomplete {{{3
NeoBundle 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default': '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions',
        \ 'cpp': $DOTVIM.'/dict/cpp.dict',
        \ 'ruby': $DOTVIM.'/dict/ruby.dict',
        \ 'perl': $DOTVIM.'/dict/perl.dict',
        \ 'php': $DOTVIM.'/dict/php.dict'
        \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns = {
        \ 'c': '[^.[:digit:] *\t]\%(\.\|->\)',
        \ 'cpp': '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::',
        \ 'ruby': '[^. *\t]\.\w*\|\h\w*::'
        \ }
" neosnippet {{{3
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" Language {{{2
NeoBundle 'sheerun/vim-polyglot'
" Ruby {{{3
NeoBundle 'rails.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-endwise'
" Python {{{3
NeoBundle 'davidhalter/jedi-vim'
" HTML {{{3
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'amirh/HTML-AutoCloseTag'
" Git {{{3
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rhysd/committia.vim'
" Markdown {{{3
NeoBundle 'mutewinter/vim-markdown'

" Reccomended {{{2
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'unite.vim'
NeoBundle 'wincent/command-T.git'
let g:CommandTMaxHeight = 20
nmap <leader>b :CommandTBuffer<CR>
nmap <leader>t :CommandT<CR>
nmap <leader>T :CommandTFlush<CR>:CommandT<CR>
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" End of initialization {{{2
filetype plugin indent on
call neobundle#end()
NeoBundleCheck


" Preferences {{{1
" Display {{{2
" Colorscheme {{{3
colorscheme jellybeans
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=88
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif
" Hilight {{{3
syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
hi CursorLine cterm=underline term=underline
" Indentation {{{3
augroup vimrc
  autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
augroup END

" Operation {{{2
" Avoid typo errors {{{3
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q
" Move {{{3
nnoremap j gj
nnoremap k gk
" Increment/Decrement {{{3
nnoremap + <C-a>
nnoremap - <C-x>
" File{{{2
" Templates {{{3
autocmd BufNewFile *.c 0r $HOME/.vim/templates/c.c
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/cpp.cpp
autocmd BufNewFile *.html 0r $HOME/.vim/templates/html.html
" Clean when Save {{{3
autocmd BufWritePre * :%s/\s\+$//e


" Functions {{{1
" Search with Dash {{{2
function! s:dash(...)
  let ft = &filetype
  if &filetype == 'python'
    let ft = ft.'2'
  endif
  let ft = ft.':'
  let word = len(a:000) == 0 ? input('Dash search: ', ft.expand('<cword>')) : ft.join(a:000, ' ')
  call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=* Dash call <SID>dash(<f-args>)
" For neocomplete {{{2
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" For lightline {{{2
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" Modelines
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
