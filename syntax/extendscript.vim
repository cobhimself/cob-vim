" Vim syntax file
" Language:     ExtendScript
" Maintainer:   Collin Brooks <collin.brooks AT gmail DOT com>
" Last Change:  December 05, 2010
" Version:      0.1
" Changes:      Initial Upload
"
" TODO:
"  - Add the HTML syntax inside the JSDoc

if !exists("main_syntax")
	if version < 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'extendscript'
endif

"" Drop fold if it set but VIM doesn't support it.
let b:extendscript_fold='true'
if version < 600    " Don't support the old version
	unlet! b:extendscript_fold
endif

"" dollar sign is permittd anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

syntax match extendScriptSpaceError		  "\s\+$" display

syntax match extendScriptDotNotation      "\." nextgroup=extendScriptPrototype,extendScriptMethodOrField,extendScriptBracket,extendScriptParenBlock

"" ExtendScript Method/Field
syntax match   extendScriptMethodOrField  /\.\h\w\{-}[\.[:blank:]\)\(\[;|,]/hs=s+1,he=e-1,me=e-1 nextgroup=extendScriptMethodOrField,

"" Namespace or Object
syntax match   extendScriptNamespace      /\h\w\{-}\./he=e-1,me=e-1 contains=extendScriptDotNotation nextgroup=extendScriptMethodOrField

"Added by Collin Brooks: logging

syntax region extendScriptLogging           start=+\[outputLn(\|\$.writeln(\|\$.write(\]+ end=+$+ keepend

"" JavaScript comments
syntax keyword extendScriptCommentTodo    TODO FIXME XXX TBD contained
syntax region  extendScriptLineComment    start=+\/\/+ end=+$+ keepend contains=extendScriptCommentTodo
syntax region  extendScriptLineComment    start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=extendScriptCommentTodo fold
syntax region  extendScriptCvsTag         start="\$\cid:" end="\$" oneline contained
syntax region  extendScriptComment        start="/\*"  end="\*/" contains=extendScriptCommentTodo,extendScriptCvsTag fold

"" JSDoc support start
if !exists("extendscript_ignore_extendscriptdoc")
	syntax case ignore

	"" syntax coloring for javadoc comments (HTML)
	syntax include @javaHtml $VIMRUNTIME/syntax/html.vim
	unlet b:current_syntax

	syntax region extendScriptDocComment    matchgroup=extendScriptComment start="/\*\*\s*$"  end="\*/" contains=extendScriptDocTags,extendScriptCommentTodo,extendScriptCvsTag fold
	syntax match  extendScriptDocTags       contained "@\(param\|argument\|requires\|exception\|throws\|type\|class\|extends\|see\|example\|lends\|exports\|link\|memberOf\|member\|module\|method\|title\|name\|namespace\|optional\|default\|base\|constant\|field\|function\|file\)\>" nextgroup=extendScriptDocParam,extendScriptDocSeeTag skipwhite
	syntax match  extendScriptDocTags       contained "@\(beta\|deprecated\|description\|fileOverview\|author\|license\|version\|returns\|return\|inner\|constructor\|private\|property\|protected\|final\|ignore\|addon\|exec\|fieldOf\|methodOf\)\>"
	syntax match  extendScriptDocParam      contained "\%(#\|\w\|\.\|:\|\/\)\+"
	syntax region extendScriptDocSeeTag     contained matchgroup=extendScriptDocSeeTag start="{" end="}" contains=extendScriptDocTags
	syntax case match
endif   "" JSDoc end

syntax case match

"" Syntax in the ExtendScript code
syntax match   extendScriptSpecial        "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
syntax region  extendScriptStringD        start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=extendScriptSpecial
syntax region  extendScriptStringS        start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=extendScriptSpecial
syntax region  extendScriptRegexpString   start=+/\(\*\|/\)\@!+ skip=+\\\\\|\\/+ end=+/[gim]\{,3}+ contains=extendScriptSpecial oneline
syntax match   extendScriptNumber         /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syntax match   extendScriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax match   extendScriptLabel          /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

"" JavaScript Prototype
syntax keyword extendScriptPrototype      prototype

"" Program Keywords
syntax keyword extendScriptSource         import export
syntax keyword extendScriptThis           this nextgroup=extendScriptMethodOrField
syntax keyword extendScriptType           const undefined var void yield 
syntax keyword extendScriptOperator       delete new in instanceof let typeof 
syntax keyword extendScriptBoolean        true false
syntax keyword extendScriptNull           null

"" Statement Keywords
syntax keyword extendScriptConditional    if else
syntax keyword extendScriptRepeat         do while for
syntax keyword extendScriptBranch         break continue switch case default return
syntax keyword extendScriptStatement      try catch throw with finally

syntax keyword extendScriptGlobalObjects  Array Boolean Date Function Infinity Math Number NaN Object RegExp String Undefined $ File Folder Socket

syntax keyword extendScriptExceptions     Error EvalError RangeError ReferenceError SyntaxError TypeError URIError

syntax keyword extendScriptFutureKeys     abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public

syntax keyword extendScriptGlobalObjects  ScriptUI Window LayoutManager ScriptUIGraphics ScriptUIPen ScriptUIBrush ScriptUIPath ScriptUIFont ScriptUIImage DrawState StaticText Button IconButton EditText ListBox DropDownList ListItem Checkbox Scrollbar RadioButton Slider Progressbar TreeView FlashPlayer Group Panel Point Dimension Bounds UIEvent

"" highlight opperators
syn match   extendScriptOperatorSymbols	"\(==\|!=\|>=\|<=\|=\~\|!\~\|>\|<\|=\)[?#]\{0,2}" skipwhite nextgroup=extendScriptMethodOrField
syn match   extendScriptOperatorSymbols	"||\|&&\|[-+.]"	skipwhite

"" Code blocks
syntax cluster extendScriptAll       contains=extendScriptOperatorSymbols,extendScriptNamespace,extendScriptMethodOrField,extendScriptComment,extendScriptLineComment,extendScriptDocComment,extendScriptStringD,extendScriptStringS,extendScriptRegexpString,extendScriptNumber,extendScriptFloat,extendScriptLabel,extendScriptSource,extendScriptType,extendScriptThis,extendScriptOperator,extendScriptBoolean,extendScriptNull,extendScriptFunction,extendScriptConditional,extendScriptRepeat,extendScriptBranch,extendScriptStatement,extendScriptGlobalObjects,extendScriptExceptions,extendScriptFutureKeys,extendScriptDotNotation,extendScriptSpaceError
syntax region  extendScriptBracket   matchgroup=extendScriptBracket transparent start="\[" end="\]" contains=@extendScriptAll,extendScriptParensErrB,extendScriptParensErrC,extendScriptBracket,extendScriptParen,extendScriptBlock,
syntax region  extendScriptParen     matchgroup=extendScriptParen   transparent start="("  end=")"  contains=@extendScriptAll,extendScriptParensErrA,extendScriptParensErrC,extendScriptParen,extendScriptBracket,extendScriptBlock nextgroup=extendScriptMethodOrField
syntax region  extendScriptBlock     matchgroup=extendScriptBlock   transparent start="{"  end="}"  contains=@extendScriptAll,extendScriptParensErrA,extendScriptParensErrB,extendScriptParen,extendScriptBracket,extendScriptBlock

"" catch errors caused by wrong parenthesis
syntax match   extendScriptParensError    ")\|}\|\]"
syntax match   extendScriptParensErrA     contained "\]"
syntax match   extendScriptParensErrB     contained ")"
syntax match   extendScriptParensErrC     contained "}"

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear extendScriptExpression
syntax cluster  htmlJavaScript contains=@extendScriptAll,extendScriptBracket,extendScriptParen,extendScriptBlock,extendScriptParenError
syntax cluster  extendScriptExpression contains=@extendScriptAll,extendScriptBracket,extendScriptParen,extendScriptBlock,extendScriptParenError,extendScriptSpaceError

if main_syntax == "extendscript"
	syntax sync clear
	syntax sync ccomment extendScriptComment minlines=200
	syntax sync match extendScriptHighlight grouphere extendScriptBlock /{/
endif

"" Fold control
if exists("b:extendscript_fold")
	syntax match   extendScriptFunction       /\<function\>/ nextgroup=extendScriptFuncName skipwhite
	syntax match   extendScriptOpAssign       /=\@<!=/ nextgroup=extendScriptFuncBlock skipwhite skipempty
	syntax region  extendScriptFuncName       contained matchgroup=extendScriptFuncName start=/\%(\$\|\w\)*\s*(/ end=/)/ contains=extendScriptLineComment,extendScriptComment nextgroup=extendScriptFuncBlock skipwhite skipempty
	syntax region  extendScriptFuncBlock      contained matchgroup=extendScriptFuncBlock start="{" end="}" contains=@extendScriptAll,extendScriptParensErrA,extendScriptParensErrB,extendScriptParen,extendScriptBracket,extendScriptBlock fold

	if &l:filetype=='extendscript' && !&diff
		" Fold setting
		" Redefine the foldtext (to show a JS function outline) and foldlevel
		" only if the entire buffer is JavaScript, but not if JavaScript syntax
		" is embedded in another syntax (e.g. HTML).
		setlocal foldmethod=syntax
		setlocal foldlevel=4
	endif
else
	syntax keyword extendScriptFunction       function
	setlocal foldmethod=syntax
	setlocal foldlevel=4
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
	HiLink extendScriptLogging              Comment
	HiLink extendScriptLineComment          Comment
	HiLink extendScriptDocComment           Comment
	HiLink extendScriptCommentTodo          Todo
	HiLink extendScriptCvsTag               Function
	HiLink extendScriptDocTags              Special
	HiLink extendScriptDocSeeTag            Function
	HiLink extendScriptDocParam             Function
	HiLink extendScriptStringS              String
	HiLink extendScriptStringD              String
	HiLink extendScriptRegexpString         String
	HiLink extendScriptCharacter            Character
	HiLink extendScriptPrototype            Type
	HiLink extendScriptConditional          Conditional
	HiLink extendScriptBranch               Conditional
	HiLink extendScriptRepeat               Repeat
	HiLink extendScriptStatement            Statement
	HiLink extendScriptFunction             Function
	HiLink extendScriptError                Error
""	HiLink extendScriptParen                Operator
	HiLink extendScriptParensError          Error
	HiLink extendScriptParensErrA           Error
	HiLink extendScriptParensErrB           Error
	HiLink extendScriptParensErrC           Error
	HiLink extendScriptOperator             Operator
	HiLink extendScriptOperatorSymbols      Type
	HiLink extendScriptDotNotation          Ignore
	HiLink extendScriptNamespace            Type
    HiLink extendScriptMethodOrField        javaScriptMethodOrField
    HiLink extendScriptThis                 javaScriptThisObject
	HiLink extendScriptType                 Type
	HiLink extendScriptNull                 Type
	HiLink extendScriptNumber               Number
	HiLink extendScriptFloat                Number
	HiLink extendScriptBoolean              Boolean
	HiLink extendScriptLabel                Label
	HiLink extendScriptSpecial              Special
	HiLink extendScriptSource               Special
	HiLink extendScriptGlobalObjects        Special
	HiLink extendScriptExceptions           Special
	HiLink extendScriptSpaceError  			Error

	delcommand HiLink
endif


let b:current_syntax = "extendscript"
if main_syntax == 'extendscript'
	unlet main_syntax
endif

" vim: ts=4
