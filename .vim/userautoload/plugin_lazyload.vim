" Ruby
augroup NeoBundleLazyRuby
  autocmd FileType rb NeoBundleSource
    \ rails.vim
    \ vim-rails
    \ vim-rake
    \ vim-projectionist
    \ vim-rspec
    \ vim-endwise
augroup END

" Python
augroup NeoBundleLazyLoadPython
  autocmd FileType py NeoBundleSource
    \ jedi-vim
augroup END

" HTML
augroup NeoBundleLazyLoadHtml
  autocmd FileType html NeoBundleSource
    \ colorizer
    \ HTML-AutoCloseTag
augroup END

" Markdown
augroup NeoBundleLazyLoadMarkdown
  autocmd FileType md NeoBundleSource
    \ vim-markdown
augroup END

"
