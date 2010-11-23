" The following mappings speed up movement within the help system.
nnoremap <silent> <buffer> <CR> <C-]>
nnoremap <silent> <buffer> <BS> <C-T>
nnoremap <silent> <buffer> o /'\l\{2,\}'<CR>
nnoremap <silent> <buffer> O ?'\l\{2,\}'<CR>
nnoremap <silent> <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <silent> <buffer> S ?\|\zs\S\+\ze\|<CR>
nnoremap <silent> <buffer> <C-N> /^=\+$<CR>:noh<CR>
nnoremap <silent> <buffer> <C-P> ?^=\+$<CR>:noh<CR>
