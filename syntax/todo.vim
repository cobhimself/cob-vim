" Vim syntax file
" Language:     Todo
" Maintainer:   Collin D. Brooks <collin.brooks@gmail.com>
" Last Change:  
" Version:      0.1
" Changes:      

if !exists("main_syntax")
	if version < 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'todo'
endif

"" Drop fold if it set but VIM doesn't support it.
let b:extendscript_fold='true'
if version < 600    " Don't support the old version
	unlet! b:extendscript_fold
endif

syntax sync fromstart

if main_syntax == "todo"
	syntax sync clear
	syntax sync ccomment extendScriptComment minlines=200
	syntax sync match extendScriptHighlight grouphere extendScriptBlock /{/
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_extendscript_syn_inits")
	if version < 508
		let did_extendscript_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink extendScriptComment              Comment

	delcommand HiLink
endif

let b:current_syntax = "todo"
if main_syntax == 'todo'
	unlet main_syntax
endif

" vim: ts=4
