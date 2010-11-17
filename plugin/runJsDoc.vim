finish
" runJsDoc.vim: Generate documentation by using the jsdoc-toolkit
"
"  Author:		Collin D. Brooks <collin.brooks@gmail.com>
"  Date:		
"  Version:		1
"
"  NOTE:        This script requires Vim 6.0 (or later)
"               Works best with Vim 7.1 with patch#215
"
"  Usage: {{{1
"
"  \hlt   : will reveal a linked list of highlighting from the top-level down
"           to the bottom level.
"           You may redefine the leading character using "let mapleader= ..."
"           in your <.vimrc>.
"
"  History: {{{1
"   3 04/07/05 :	* cpo&vim supported
"   2 07/14/04 :	* register a is used as before but now its original contents are restored
"   				* bugfix: redraw taken before echo to fix message display
"   				* debugging code installed
"  	1 08/01/01 :	* the first release
"  License: {{{1
"  This file is placed in the public domain.
" ---------------------------------------------------------------------
"  Load Once: {{{1
if exists("g:loaded_runJsDoc") || &cp
  finish
endif
let g:loaded_runJsDoc= "v1"

" ---------------------------------------------------------------------
"  Version Check: {{{1
if v:version < 700
 echohl WarningMsg
 echo "***warning*** this version of runJsDoc needs vim 7.0"
 echohl Normal
 finish
endif
let s:keepcpo= &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Initialization: {{{1
let s:jsdoc_dir
let s:jsdoc_tempDir
let s:jsdoc_template
let s:jsdoc_conf
let s:jsdoc_
" ---------------------------------------------------------------------
" Public Interface: {{{1
if !hasmapto('<Plug>RunJsDoc')
  nmap <c-F12>  <Leader>hlt
  nmap <unique> <Leader>hlt <Plug>HiLinkTrace
endif
map <script> <Plug>HiLinkTrace	:call <SID>HiLinkTrace(0)<CR>
com! -bang	HLT					call s:HiLinkTrace(<bang>0)
com!		HLTm				call s:HiLinkTrace(1)

" ---------------------------------------------------------------------
"  Options: {{{1

let &cpo= s:keepcpo
" ---------------------------------------------------------------------
" vim: fdm=marker
