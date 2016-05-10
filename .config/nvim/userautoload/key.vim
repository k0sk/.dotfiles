" Save and Quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Avoid typo errors
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" Move
nnoremap j gj
nnoremap k gk

" Increment/Decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Jump to end of the pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
