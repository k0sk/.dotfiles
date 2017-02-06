let g:quickrun_config={
\ '_' : {
\   'outputter': 'error',
\   'outputter/error/success': 'buffer',
\   'outputter/error/error': 'quickfix',
\   'outputter/buffer/split': ':botright 8sp',
\   'outputter/quickfix/open_cmd': 'copen',
\   'runner': 'vimproc',
\   'runner/vimproc/updatetime': 500,
\ },
\ 'cpp': {
\   'type': 'cpp/g++',
\ },
\ }
