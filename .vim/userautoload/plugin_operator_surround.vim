" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)


" delete or replace most inner surround

" if you use vim-textobj-multiblock
" nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" if you use vim-textobj-anyblock
" nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
" nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

" if you use vim-textobj-between
" nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
" nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)
