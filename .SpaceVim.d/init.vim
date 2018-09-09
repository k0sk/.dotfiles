augroup vimrc
  autocmd!
augroup END

"
" SpaceVim
"
let g:spacevim_colorscheme = 'onedark'
let g:spacevim_custom_plugins = [
    \ ['osyo-manga/vim-over', {'on_cmd': 'OverCommandLine'}],
    \ ['itchyny/dictionary.vim', {'on_cmd': 'Dictionary'}],
    \ ['kana/vim-smartword', {'on_map': '<Plug>(smartword'}],
    \ ['junegunn/vim-easy-align', {'on_map': '<Plug>(EasyAlign)'}],
    \ ['cohama/lexima.vim', {'on_i': 1}],
    \ ['rhysd/committia.vim', {'on_path': '.*/COMMIT_EDITMSG'}],
\ ]
" \ ['chrisbra/improvedft', {'on_i': 1}],
let g:spacevim_relativenumber = 0

"
" Preferences
"
if has('nvim')
    set mouse=a
endif
set list " show invisible chars
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set clipboard=unnamed
autocmd vimrc BufWritePre * :%s/\s\+$//e " clean whispaces before saving

" Better same line join
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Show errors for too long lines and trailing spaces
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

"
" Mappings
"
" Turn off hilights
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" Enable jk within the same line
" nnoremap j gj
" nnoremap k gk

" Increment / Decrement
" nnoremap + <C-a>
" nnoremap - <C-x>

" Jump to end of the yanked/pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Avoid typo errors
cab W! w!
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

" nnoremap <silent> <Leader>m :OverCommandLine<CR>
call SpaceVim#custom#SPC('nnoremap', ['m'], ':OverCommandLine', 'Substitute preview', 1)

nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)

vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" nnoremap <silent> <Leader>d :Dictionary<CR>
call SpaceVim#custom#SPC('nnoremap', ['d'], ':Dictionary', 'Dictionary', 1)

