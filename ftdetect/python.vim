autocmd FileType python set omnifunc=pythoncomplete#Complete
au! BufNewFile,BufRead *.py compiler pylint
au! BufNewFile,BufRead test_*.py compiler nose
