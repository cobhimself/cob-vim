augroup extendscript
    au!
    au BufRead,BufNewFile *.jsx,*.jsxinc set filetype=extendscript
    au BufRead *.jsx,*.jsxinc setlocal dictionary=$HOME/.vim/dictionaries/extendscript/*
    au BufRead,BufNewFile *.jsx,*.jsxinc set comments=sr:/*,mb1:*,exr:*/,sr:/**,mb1:*,exr:*/,://
    au BufNewFile *.jsx,*.jsxinc 0r ~/.vim/skeletons/skeleton.jsx 
augroup END
