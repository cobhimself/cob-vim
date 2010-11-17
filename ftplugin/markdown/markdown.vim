" File: markdownMaker
" Author: Collin D. Brooks <collin.brooks@gmail.com>
" Description: Provides key mappings for quick markdown file creations
" Last Modified: November 15, 2010

" Only do this when not done yet for this buffer and the user hasn't decided to
" not load this plugin by setting it as loaded.
if exists("b:did_markdownMaker" || exists("g:loaded_markdownMaker" || version < 700))
  finish
endif
let b:did_markdownMaker = 1
let g:loaded_markdownMaker = 1

" Make sure the plugin doesn't break anything if the user has 'compatible' set.
let s:save_cpo = &cpo
set cpo&vim

" Setup the mapping
if !hasmapto('<Plug>markdownMaker')
  imap <buffer> <unique> <Leader>h <Plug>markdownMaker<SID>MakeHeader
endif
noremap <buffer> <unique> <c-h> <Plug>markdownMaker <SID>MakeHeader 


function! s:MakeHeader()
   <Esc>0Vyp:s/./=/g 
endfunction

noremap <SID>markdownMaker :call <SID>markdownMaker()<CR>

" Reset the user's cpo settings
let &cpo = s:save_cpo
