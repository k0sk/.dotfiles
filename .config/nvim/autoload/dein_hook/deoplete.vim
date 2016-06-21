" function! dein_hook#deoplete#source() abort
  set completeopt+=noinsert

  let g:deoplete#enable_smart_case = 1

  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'


  let g:deoplete#sources = {}
  let g:deoplete#sources_ = ['buffer','tag']

  let g:deoplete#omni_patterns = {}
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.python = ''
  let g:deoplete#omni#input_patterns.ruby =
        \ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'


  " Undo inputted candidate. >
  inoremap <expr><C-g>     deoplete#mappings#undo_completion()

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function() abort
    return deoplete#mappings#close_popup() . "\<CR>"
  endfunction

  " <TAB>: completeion
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  inoremap <expr> '  pumvisible() ? deoplete#mappings#close_popup() : "'"

" endfunction

