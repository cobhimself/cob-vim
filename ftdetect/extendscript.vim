au BufRead,BufNewFile *.jsx,*.jsxinc set filetype=extendscript
            \setlocal dictionary=$HOME/.vim/dictionaries/extendscript/* 
au BufNewFile *.jsx,*.jsxinc 0r ~/.vim/skeletons/skeleton.jsx 
