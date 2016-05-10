function! dein_hook#deoplete#source() abort
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#sources#syntax#min_keyword_length = 3

endfunction
