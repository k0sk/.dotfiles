augroup vimrc
  autocmd!
augroup END

let g:python_host_prog  = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

"
" SpaceVim
"
execute 'source' expand('~/.dotfiles/.SpaceVim/config/main.vim')

let g:spacevim_colorscheme = 'base16-railscasts'
let g:spacevim_custom_plugins = [
            \ ['rhysd/committia.vim', {'on_path': '.*/COMMIT_EDITMSG'}],
            \ ['kana/vim-smartword', {'on_map': '<Plug>(smartword'}],
            \ ['junegunn/vim-easy-align', {'on_map': '<Plug>(EasyAlign)'}],
            \ ['Lokaltog/vim-easymotion', {'on_map': '<Plug>(easymotion-s2)'}],
            \ ['haya14busa/incsearch.vim', {'on_map': '<Plug>(incsearch'}],
            \ ['osyo-manga/vim-over', {'on_cmd': 'OverCommandLine'}],
            \ ]
"\ ['cohama/lexima.vim'],
"\ ['chrisbra/improvedft'],

"
" Preferences
"
let g:mapleader = "\<Space>"
set mouse=a
set norelativenumber
set list " Invisible chars
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set clipboard=unnamed " Clipboard
autocmd vimrc BufWritePre * :%s/\s\+$//e " Clean whispaces before saving

"
" Mappings
"
nmap <silent> <ESC><ESC> :nohlsearch<CR>

"nnoremap j gj " Enable jk within the same line
"nnoremap k gk

"nnoremap + <C-a> " Increment / Decrement
"nnoremap - <C-x>

vnoremap <silent> y y`] " Jump to end of the pasted text
vnoremap <silent> p p`]
nnoremap <silent> p p`]

cab W! w! " Avoid typo errors
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"
" Mappings for plugins
"
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

nnoremap <Leader>o :CtrlP<CR>

nnoremap <silent> <Leader>m :OverCommandLine<CR>

"nmap w <Plug>(smartword-w)
"nmap b <Plug>(smartword-b)
"nmap e <Plug>(smartword-e)

vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"nmap s <Plug>(easymotion-s2)

"nnoremap <Leader>d :Dictionary<CR>

"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

