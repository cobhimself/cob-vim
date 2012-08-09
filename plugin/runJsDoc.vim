" vim: fdm=marker
" runJsDoc.vim: Generate documentation by using the jsdoc-toolkit
"
"  Author:		Collin D. Brooks <collin.brooks@gmail.com>
"  Date:		
"  Version:		1
"
"  NOTE:        This script requires Vim 6.0 (or later)
"
"  Usage: {{{1
"
"  /jsd     Runs the jsdoc-toolkit application on the file that is currenty open.
"           You may redefine the leading character using "let mapleader= ..."
"           in your <.vimrc>.
"
"  History: {{{1
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
if v:version < 600
 echohl WarningMsg
 echo "***warning*** this version of runJsDoc needs vim 6.0"
 echohl Normal
 finish
endif
let s:keepcpo= &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Initialization: {{{1
let s:jsdoc_dir="$HOME/Dropbox/Applications/jsdoc-toolkit/"
"let s:jsdoc_conf=s:jsdoc_dir . "conf/COB_ISSD.conf"
let s:jsdoc_conf=s:jsdoc_dir . "conf/testbefore.conf"
let s:jsdoc_app=s:jsdoc_dir . "app/run.js"

fun! <SID>RunJsDoc(...)
    let s:cmd = "! java -jar " . s:jsdoc_dir . "jsrun.jar " . s:jsdoc_app . " -c=" . s:jsdoc_conf
    for c in a:000
        s:cmd .= " " . c
    endfor
    echo s:cmd
    execute s:cmd
endfun

" ---------------------------------------------------------------------
" Public Interface: {{{1

if !hasmapto('<Plug>RunJsDoc')
  nmap  <Leader>jsd call <SID>RunJsDoc() <CR>
endif

com! -nargs=* RunJsDoc call <SID>RunJsDoc(<f-args>)<CR>


" ---------------------------------------------------------------------
"  Options: {{{1

let &cpo= s:keepcpo
" ---------------------------------------------------------------------
