set encoding=utf-8
scriptencoding utf-8

" 一般設定 {{{2
" 表示関係 {{{2
syntax on
colorscheme jellybeans
set title
set number
set laststatus=2 " ステータス行の行数
set matchpairs& matchpairs+=<:> " <>を対応する括弧に設定
set cursorline " カレント行のハイライト
highlight CursorLine cterm=underline
set wrap " テキストの折り返し
set textwidth=80 " 自動的な改行
set colorcolumn=80 " 80文字目にラインを入れる
set showcmd " 入力中のコマンドを表示
set list "不可視文字の表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" インデント関係{{{2
filetype on
filetype indent on
filetype plugin on
set tabstop=2 " TAB幅をスペース二つ分にする
set shiftwidth=2 " 自動インデントとインデント時の幅
set softtabstop=2 " 連続した空白に対してタブ、バックスペースキーが作用する幅
set expandtab " タブ文字を\tじゃなくスペースに置換
set autoindent " 改行時に前の行のインデントを継続
set smartindent " 改行時に前の行の末尾に合わせた自動インデント

" 検索関係 {{{2
set smartcase " 検索時に大文字を含んでいたら大/小を区別
set incsearch " 検索文字打ち込みで即検索
set hlsearch " 検索結果のハイライト
nmap <silent> <ESC><ESC> :nohlsearch<CR>
set wrapscan " 検索時に最後まで行ったら最初に戻る

" 入力関係 {{{2
set wildmenu " 補完候補を表示する
set infercase " 補完時に大文字、小文字を区別しない
set backspace=indent,eol,start " バックスペースでインデントや改行を削除できるようにする
set clipboard=unnamed,autoselect " コピペ
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,s,<,>,[,],~ " カーソルを行頭、行末で止まらないようにする
" ESCの反応を早く
set timeout
set timeoutlen=200
set ttimeoutlen=75
" 挿入モードでもhjkl移動
noremap! <c-h> <Left>
noremap! <c-j> <Down>
noremap! <c-k> <Up>
noremap! <c-l> <Right>

" 保存関係 {{{2
" 文字コード設定
set termencoding=utf-8
set fileencoding=utf-8
set fileformat=unix
"エンコーディング
set bomb
set ttyfast
set binary
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//e
" スワップファイルを作成しない
set noswapfile
set nobackup
set nowritebackup

" modeline {{{2
set modeline " モードラインを有効にする
set modelines=3 " 3行目までをモードラインとして検索する

" プラグイン管理 {{{1
" 基本設定 {{{2
" Be iMproved
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'tools\\update-dll-mingw',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \   },
  \ }
" My Bundles and settings

" Colorschemes {{{2
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'ciaranm/inkpot'

" Unite-colorscheme
NeoBundle 'ujihisa/unite-colorscheme'
imap <C-k> <C-x><C-o>

NeoBundle 'vim-scripts/CSApprox'

" コーディングルールの準拠チェック {{{2
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'passive_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" 一括置換 - vim-over {{{ 2
NeoBundle 'osyo-manga/vim-over'
nnoremap <silent> <Leader>m :OverCommandLine<CR>%s/

" ノーマルモード移行時に自動保存 - wauto.vim {{{2
NeoBundle 'syui/wauto.vim'

" コメント機能改善 - nerdcommenter {{{2
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
let NERDShutUp=1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" プログラムを簡易実行 - quickrun {{{2
NeoBundle 'thinca/vim-quickrun.git'
nmap <leader>r :QuickRun<CR>
let g:quickhl_config = {'_': {'split': 'vertical'}}

" インデントレベルを可視化 - indentLine {{{2
if has('conceal')
  NeoBundleLazy 'Yggdroot/indentLine', { 'autoload': {
    \ 'commands': ['IndentLinesReset', 'IndentLinesToggle']
    \ }}
endif

" 言語パック {{{2
NeoBundle 'sheerun/vim-polyglot'

" grep {{{2
NeoBundle 'vim-scripts/grep.vim'
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'

" vimshell {{{2
NeoBundle 'Shougo/vimshell.vim'
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> <leader>sh :VimShellCreate<CR>

" 補完 - neocomplete {{{2
NeoBundle 'Shougo/neocomplete.vim'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'cpp' : $DOTVIM.'/dict/cpp.dict',
      \ 'ruby' : $DOTVIM.'/dict/ruby.dict',
      \ 'perl' : $DOTVIM.'/dict/perl.dict',
      \ 'php' : $DOTVIM.'/dict/php.dict'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : \<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword .
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" スニペット - neosnippet {{{2
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" g:neosnippet#snippets_directory variable (e.g Honza's Snippets)
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" " Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" 括弧を自動で閉じる - autoclose {{{2
NeoBundle 'Townk/vim-autoclose'

" 整列 vim-easy-align {{{2
NeoBundleLazy 'junegunn/vim-easy-align', { 'autoload': {
      \ 'commands' : ['EasyAlign'] }}

" 囲みを簡単にする - vim-operator-surround {{{2
NeoBundle 'kana/vim-operator-user' " dependency
NeoBundle 'rhysd/vim-operator-surround'
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" ステータスラインをカスタマイズ - lightline {{{2
NeoBundle 'itchyny/lightline.vim'
set t_Co=256
set term=xterm-256color
let g:lightline = {
    \ 'colorscheme': 'jellybeans'
    \ }

" 検索・置換を改善 - incsearch {{{2
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" 任意の単語をハイライト - quickhl {{{2
NeoBundle 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" NERD Tree {{{2
NeoBundle 'scrooloose/nerdtree'
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
let g:NERDSpaceDelims = 1

" Explorer - netrw {{{2
NeoBundle 'vim-scripts/netrw.vim'
let g:netrw_liststyle=3
let g:netrw_list_hide='.DS_Store'

" Clever-f {{{2
NeoBundle 'rhysd/clever-f.vim'

" Unite.vim {{{2
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキー2回押しで終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" Ruby {{{2
NeoBundle 'rails.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'majutsushi/tagbar'
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_type_ruby = {
			\ 'kinds' : [
			\ 'm:modules',
			\ 'c:classes',
			\ 'd:describes',
			\ 'C:contexts',
			\ 'f:methods',
			\ 'F:singleton methods'
			\ ]
			\ }

NeoBundle 'tpope/vim-endwise'

" HTML {{{2
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'amirh/HTML-AutoCloseTag'

" Python {{{2
NeoBundle 'davidhalter/jedi-vim'

" Git {{{2
" Gitラッパー
NeoBundle 'tpope/vim-fugitive'
" 差分の表示
NeoBundle 'airblade/vim-gitgutter'
" コミットバッファを改善
NeoBundle 'rhysd/committia.vim'

" etc {{{2
NeoBundle 'Shougo/vimfiler.vim'
" ファイルセレクタ
NeoBundle 'kien/ctrlp.vim'
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = ',e'
let g:ctrlp_open_new_file = 'r'

" Original repos on github {{{2
NeoBundle 'mutewinter/vim-markdown'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'unite.vim'
" Non github repos
NeoBundle 'wincent/command-T.git'
let g:CommandTMaxHeight = 20
nmap <leader>b :CommandTBuffer<CR>
nmap <leader>t :CommandT<CR>
nmap <leader>T :CommandTFlush<CR>:CommandT<CR>
" gist repos
" NeoBundle 'gist:Shougo/656148', {
"    \ 'name': 'everything.vim',
"    \ 'script_type': 'plugin'}
" Non git repos
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" ...

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" その他 {{{1
" テンプレート設定 {{{2
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt
autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt
autocmd BufNewFile *.php 0r $HOME/.vim/template/php.txt

" Dashでリファレンス検索 {{{2
function! s:dash(...)
  let word = len(a:000) == 0 ? input('Dash search: ') : a:1
  call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=? Dash call <SID>dash(<f-args>)

" 防タイポ {{{2
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" modeline {{{2
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=1
