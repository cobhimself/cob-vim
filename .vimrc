" vim: set foldmarker={,} foldlevel=1 foldmethod=marker modelines=4

" Environment {
"     General {
        set nocompatible " MUST BE FIRST LINE!
"
"     }

"     Windows Compatibility {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier. 
		if has('win32') || has('win64')
		  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		endif
"     }
"
"     Bundle Support {
		runtime! autoload/pathogen.vim
		call pathogen#runtime_append_all_bundles()
		call pathogen#helptags()
"     }
" }

" General Options {
"
	filetype plugin indent on  	    " Automatically detect file types.
	scriptencoding utf-8
	syntax on 					    " syntax highlighting

    " Formatting {
        set nowrap                     	" wrap long lines
        set autoindent                 	" indent at the same level of the previous line
        set shiftwidth=4               	" use indents of 4 spaces
        set tabstop=4 					" an indentation every four columns
        set matchpairs+=<:>             " Match, to be used with %
        set comments=sl:/*,mb:*,elx:*/  " Auto format comment blocks
        set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
    " }
	set background=dark             " Assume a dark background
    set vb t_vb=""		            " I don't care about bells
    set virtualedit=all             " Turn virtual edit on
    set hidden                      " Don't need to save files to hide them
    set lazyredraw                  " Don't update the display while executing macros
    set textwidth=80                " set the text width to 120
    set wrapscan                    " Wrap the scan
    set ch=2                        " Make the command line two lines high
    set laststatus=2                " Tell VIM to always put a status line in, even if there is only one window
    set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds
    set synmaxcol=2048              " Syntax coloring lines that are too long is too slow
    set incsearch                   " Set incremental search
    set smartcase                   "Set the search to scan so it ignores case when the search is all lowercase but recognizes uppercase if it's specified.                      
    set shellslash                  " set the forward slash to be the slash to use
    set backspace=2                 " Allow backspacing over indent, eol, and the start of an insert
	set autowrite                   " automatically write a file when leaving a modified buffer
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	set history=1000  				" Store a ton of history (default is 20)
	set nospell    	 	        	" spell checking on
    
    " When the page starts to scroll, keep the cursor 8 lines from the top and 8
    " lines from the bottom
    set scrolloff=8

    set showfulltag                 " When completing by tag, show the whole tag, not just the function name
    set fillchars=""                " get rid of the silly characters in window separators
    set expandtab                   " Turn tabs into spaces
    
    " GUI Options {
        set mouse=a					    " automatically enable mouse usage

        " Set up the gui cursor to look nice
        set guicursor=n-v-c:block-Cursor-blinkon0
        set guicursor+=ve:ver35-Cursor
        set guicursor+=o:hor50-Cursor
        set guicursor+=i-ci:ver25-Cursor
        set guicursor+=r-cr:hor20-Cursor
        set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

        color cob     	       		    " load a colorscheme
        set tabpagemax=15 				" only show 15 tabs
        set showmode                   	" display the current mode

        set cursorline  				" highlight current line
        hi cursorline guibg=#333333 	" highlight bg color of current line
        hi CursorColumn guibg=#333333   " highlight cursor

        if has('cmdline_info')
            set ruler                  	" show the ruler
            set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
            set showcmd                	" show partial commands in status line and
                                        " selected characters/lines in visual mode
        endif

        if has('statusline')
            set laststatus=1           	" show statusline only if there are > 1 windows
            " Use the commented line if fugitive isn't installed
            "set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
            "set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
            set statusline=%<%f\ %h%m%r%{fugitive#statusline()}[%Y,%{&ff}]\ %=[ASCII=\%03.3b]\ [HEX=\%02.2B]\ %-14.(%l,%c%V%)\ %P
			"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
        endif

        set backspace=indent,eol,start 	" backspace for dummys
        set linespace=0 				" No extra spaces between rows
        set nu 							" Line numbers on
        set showmatch                  	" show matching brackets/parenthesis
        set incsearch 					" find as you type search
        set hlsearch 					" highlight search terms
        set winminheight=0 				" windows can be 0 line high 
        set ignorecase 					" case insensitive search
        set smartcase 					" case sensitive when uc present
        set wildmenu 					" show list instead of just completing
        set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
        set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
        set scrolljump=5 				" lines to scroll when cursor leaves screen
        set scrolloff=3 				" minimum lines to keep above and below cursor
        set foldenable  				" auto fold code
        set gdefault					" the /g flag on :s substitutions by default
    " }

    " Folder Locations {
    "
		set backup 						" backups are nice ...
		set backupdir=$HOME/.vimbackup//  " but not when they clog .
		set directory=$HOME/.vimswap// 	" Same for swap files
		set viewdir=$HOME/.vimviews// 	" same for view files
		
		"" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
		au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }

" }

" Key Mappings {
"
    " Turn off highlight search
    "nmap <silent> ,n :set invhls:set hls?<cr>

    " Set Text wrapping toggles
    "nmap <silent> ,w :set invwrap:set wrap?<cr>

    " Open NERD Tree
    nmap <silent> ,nt :NERDTree<cr>

    " Save and reload the current file.
    nmap <silent> ,re :w <cr>:e %<cr>

    " Let's make it easy to edit this file (mnemonic for the key sequence is
    " 'e'dit 'v'imrc)
    nmap <silent> ,ev :e $MYVIMRC<cr>

    " And to source this file as well (mnemonic for the key sequence is
    " 's'ource 'v'imrc)
    nmap <silent> ,sv :so $MYVIMRC<cr>

    " Run the command that was just yanked
    nmap <silent> ,rc :@"<cr>

    " allow command line editing like emacs
    cnoremap <C-A>      <Home>
    cnoremap <C-B>      <Left>
    cnoremap <C-E>      <End>
    cnoremap <C-F>      <Right>
    cnoremap <C-N>      <End>
    cnoremap <C-P>      <Up>
    cnoremap <ESC>b     <S-Left>
    cnoremap <ESC><C-B> <S-Left>
    cnoremap <ESC>f     <S-Right>
    cnoremap <ESC><C-F> <S-Right>
    cnoremap <ESC><C-H> <C-W>

    " Maps to make handling windows a bit easier
    noremap <silent> ,h :wincmd h<CR>
    noremap <silent> ,j :wincmd j<CR>
    noremap <silent> ,k :wincmd k<CR>
    noremap <silent> ,l :wincmd l<CR>
    noremap <silent> ,sb :wincmd p<CR>
    noremap <silent> <C-F9>  :vertical resize -10<CR>
    noremap <silent> <C-F10> :resize +10<CR>
    noremap <silent> <C-F11> :resize -10<CR>
    noremap <silent> <C-F12> :vertical resize +10<CR>
    noremap <silent> ,s8 :vertical resize 83<CR>
    noremap <silent> ,cj :wincmd j<CR>:close<CR>
    noremap <silent> ,ck :wincmd k<CR>:close<CR>
    noremap <silent> ,ch :wincmd h<CR>:close<CR>
    noremap <silent> ,cl :wincmd l<CR>:close<CR>
    noremap <silent> ,cc :close<CR>
    noremap <silent> ,cw :cclose<CR>
    noremap <silent> ,ml <C-W>L
    noremap <silent> ,mk <C-W>K
    noremap <silent> ,mh <C-W>H
    noremap <silent> ,mj <C-W>J
    noremap <silent> <C-7> <C-W>>
    noremap <silent> <C-8> <C-W>+
    noremap <silent> <C-9> <C-W>+
    noremap <silent> <C-0> <C-W>>

    " Move the current window forward (to the right) of the next window in the row
    nmap <silent> ,mf <C-W>r

    " Move the current window backwards (to the left) of the next window in the row
    nmap <silent> ,mb <C-W>R

    " Search the current file for what's currently in the search
    " register and display matches
    nmap <silent> ,gs
         \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

    " Search the current file for the word under the cursor and display matches
    nmap <silent> ,gw
         \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

    " Search the current file for the WORD under the cursor and display matches
    nmap <silent> ,gW
         \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

    " The following beast is something i didn't write... it will return the
    " syntax highlighting group that the current "thing" under the cursor
    " belongs to -- very useful for figuring out what to change as far as
    " syntax highlighting goes.
    nmap <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
         \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
         \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
         \ . ">"<CR>

	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

	" For when you forget to sudo.. Really Write the file.
	cmap w!! w !sudo tee % >/dev/null
" }

" Plugins {

    " NERDTree {
        let NERDTreeShowBookmarks = 1
		let g:NERDShutUp=1
    " }

    " NERDComment {
		"comment out line(s) in visual mode
		vmap  o  :call NERDComment(1, 'toggle')<CR>
    " }

	" PIV {
		let g:DisableAutoPHPFolding = 0
	" }
	
	" Supertab {
		let g:SuperTabDefaultCompletionType = "context"
        "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" }

	" Misc { 
		let g:checksyntax_auto = 0
		let b:match_ignorecase = 1
	" }

	" ShowMarks {
		let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		" Don't leave on by default, use :ShowMarksOn to enable
		let g:showmarks_enable = 0
        map <silent> <F2> :ShowMarksToggle<CR>
	" }
	
	" OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

		" Popup menu hightLight Group
		"highlight Pmenu 	ctermbg=13 	guibg=DarkBlue
		highlight PmenuSel 	ctermbg=7 	guibg=DarkBlue 		guifg=LightBlue
		"highlight PmenuSbar ctermbg=7 	guibg=DarkGray
		"highlight PmenuThumb 			guibg=Black

		hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
		hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
		hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

		" some convenient mappings 
		inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
		inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
		inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
		inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
		inoremap <expr> <C-d> 	   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
		inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

		" automatically open and close the popup menu / preview window
		au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
		set completeopt=menu,longest,preview
	" }
	
	" Ctags {
		set tags=./tags;/,~/.vimtags
	" }

	" AutoCloseTag {
		" Make it so AutoCloseTag works for xml and xhtml files as well
		au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
	" }

	" SnipMate {
		" Setting the author var
		let g:snips_author = 'Collin D. Brooks <collin.brooks@gmail.com>'
		" Shortcut for reloading snippets, useful when developing
		nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
	" }

    " taglist {
        nnoremap <silent> <F3> :TlistToggle<CR>

        "Let taglist handle extendscript files as javascript
        let tlist_extendscript_settings= 'JavaScript;c:Classes;m:Methods;p:Properties;f:Functions;v:Variables'
    " }

    " jslint {
        let g:JSLintHighlightErrorLine = 0
    " }
" }

" Custom Functions {
" }

" Startup Settings {
    " Auto Full Screen Mode
    if has("gui_running")
        set fuoptions=maxvert,maxhorz
        au GUIEnter * set fullscreen
    endif

    "Load NERDTree on startup
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
" }
