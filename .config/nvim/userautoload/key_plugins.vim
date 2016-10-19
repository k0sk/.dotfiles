" Netrw
let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'
let g:netrw_liststyle=3
let g:netrw_list_hide='^\._.*$,^\.DS_Store$'

" DWM
nmap <C-n> <Plug>DWMNew
nmap <C-c> <Plug>DWMClose
nmap <C-@> <Plug>DWMFocus
nmap <C-l> <Plug>DWMGrowMaster
nmap <C-h> <Plug>DWMShrinkMaster

" vim-over
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ctrlp
nnoremap <Leader>o :CtrlP<CR>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" quickrun
nnoremap <leader>r :QuickRun<CR>

" nerdcommenter
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Dictionary {{{2
nnoremap <Leader>d :Dictionary<CR>

" Easy-motion
nmap s <Plug>(easymotion-s2)

" smartword
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)

