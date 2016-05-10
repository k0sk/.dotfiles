function! dein_hook#ctrlp#source() abort
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_custom_ignore={
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

  function! OpenWithDWM(action, line)
    call ctrlp#acceptfile(a:action, a:line)
    if winnr() !=# 1 && exists('*DWM_Focus')
      call DWM_Focus()
    endif
  endfunction

  let g:ctrlp_open_func={
    \ 'files'    : 'OpenWithDWM',
    \ 'buffers'  : 'OpenWithDWM',
    \ 'mru files': 'OpenWithDWM',
    \ }
endfunction
