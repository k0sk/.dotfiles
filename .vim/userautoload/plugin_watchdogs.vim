let s:watchdog_config={
  \ 'watchdogs_checker/_': {
  \   'hook/close_quickfix/enable_exit': 1,
  \ },
  \
  \ 'cpp/watchdogs_checker': {
  \   'type': 'watchdogs_checker/g++'
  \ },
  \ 'watchdogs_checker/g++': {
  \   'command': 'g++',
  \   'exec': '%c %o -fsyntax-only %s:p ',
  \   'cmdopt': '-Wall',
  \ },
  \ 'watchdogs_checker/clang++': {
  \   'command': 'clang++',
  \   'exec': '%c %o -fsyntax-only %s:p ',
  \   'cmdopt': '-Wall',
  \ },
\ }

call extend(g:quickrun_config, s:watchdog_config)
unlet s:watchdog_config

" Auto check
let g:watchdogs_check_BufWritePost_enables={
  \ 'cpp': 1,
  \ 'ruby': 1,
  \ 'python': 1
  \ }

let s:bundle_wd=neobundle#get('vim-watchdogs')
function! s:bundle_wd.hooks.on_source(bundle_wd)
  call watchdogs#setup(g:quickrun_config)
endfunction
unlet s:bundle_wd

