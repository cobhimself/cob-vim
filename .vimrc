" vim: set foldmarker={,} foldlevel=1 foldmethod=marker modelines=4

" Environment {
"     General {
        set nocompatible " MUST BE FIRST LINE!
"     }

"     Windows Compatibility {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier. 
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
"     }
"
" }

"    Vundle {
        filetype off 
		set rtp+=~/.vim/bundle/Vundle.vim
		call vundle#begin()
        let g:vundle_default_git_proto = 'git'

        " let Vundle manage Vundle
        " required! 
        Plugin 'gmarik/Vundle.vim'

        " My Plugins here:
        "
        " original repos on github
        "Plugin 'plasticboy/vim-markdown'
        Plugin 'vim-scripts/Smart-Tabs'
        Plugin 'Lokaltog/vim-powerline'
        Plugin 'ScrollColors'
        "Plugin 'StanAngeloff/php.vim' 
        Plugin 'ervandew/supertab'
        Plugin 'gmarik/ide-popup.vim'
        Plugin 'groenewege/vim-less'
        Plugin 'jeetsukumaran/vim-buffergator'
        Plugin 'kien/ctrlp.vim'
        Plugin 'majutsushi/tagbar'
        Plugin 'msanders/snipmate.vim'
        Plugin 'nathanaelkane/vim-indent-guides'
        Plugin 'nvie/vim-flake8'
        Plugin 'othree/xml.vim'
        Plugin 'plasticboy/vim-markdown'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'scrooloose/nerdtree'
        Plugin 'scrooloose/syntastic'
        Plugin 'tisho/css-snippets-snipmate'
        Plugin 'tpope/vim-fugitive'
        "Plugin 'tpope/vim-markdown'
        Plugin 'tpope/vim-surround'
        Plugin 'vim-scripts/EasyMotion'
        "Plugin 'vim-scripts/ShowMarks'
        Plugin 'vim-scripts/vimwiki'
        Plugin 'spf13/PIV'
        Plugin 'altercation/vim-colors-solarized'
        "Plugin 'vim-scripts/php-doc-upgrade'
        "Plugin 'klokane/vim-phpunit'
        Plugin 'joonty/vim-phpqa.git'
        Plugin 'mattn/emmet-vim'
        "Plugin 'Raimondi/delimitMate'
        
		" All of your Plugins must be added before the following line
		call vundle#end()            " required
		filetype plugin indent on    " required

		" Brief help
		" " :PluginList       - lists configured plugins
		" " :PluginInstall    - installs plugins; append `!` to update or just
		" :PluginUpdate
		" " :PluginSearch foo - searches for foo; append `!` to refresh local
		" cache
		" " :PluginClean      - confirms removal of unused plugins; append `!`
		" to auto-approve removal
		" "
		" " see :h vundle for more details or wiki for FAQ
		" " Put your non-Plugin stuff after this line

"    }

" General Options {
"
    scriptencoding utf-8
    syntax on 					    " syntax highlighting

    " Formatting {
        set nowrap                     	" wrap long lines
        set autoindent                 	" indent at the same level of the previous line
        set shiftwidth=4               	" use indents of 4 spaces
        set tabstop=4 					" an indentation every four columns
        set matchpairs+=<:>             " Match, to be used with %
        set comments=sr:/*,mb1:*,exr:*/,sr:/**,mb1:*,exr:*/,://  " Auto format comment blocks
        set formatoptions=tcroql        " For automatic formatting.
        set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
    " }
    set background=dark             " Assume a dark background
    " List chars
    set listchars=""                  " Reset the listchars
    "set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
    "set listchars+=trail:.            " show trailing spaces as dots
    set listchars+=extends:>          " The character to show in the last column when wrap is
                                      " off and the line continues beyond the right of the screen
    set listchars+=precedes:<         " The character to show in the last column when wrap is
                                      " off and the line continues beyond the right of the screen
    set listchars+=tab:\|\ 
    set vb t_vb=""		            " I don't care about bells
    set virtualedit=all             " Turn virtual edit on
    set hidden                      " Don't need to save files to hide them
    set lazyredraw                  " Don't update the display while executing macros
    set textwidth=79                " set the text width to 79
    set wrapscan                    " Wrap the scan
    set ch=2                        " Make the command line two lines high
    set laststatus=2                " Tell VIM to always put a status line in, even if there is only one window
    set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds
    set synmaxcol=2048              " Syntax coloring lines that are too long is too slow
    set incsearch                   " Set incremental search
    set smartcase                   " Set the search to scan so it ignores case when the search is all lowercase but recognizes uppercase if it's specified.                      
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
    "set noexpandtab                   " Don't turn tabs into spaces

    " Visual Options {
    
        color solarized        		    " load a colorscheme
        "color cob     	       		    " load a colorscheme
        let python_highlight_all=1      " Use all highlighting from python syntax
        set tabpagemax=15 				" only show 15 tabs
        set showmode                   	" display the current mode

        set cursorline  				" highlight current line
        "hi cursorline guibg=#333333 	" highlight bg color of current line
        "hi CursorColumn guibg=#333333   " highlight cursor

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
            set statusline=%b\ 0x%B
            "set statusline=%<%t\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
            set statusline=%<%t\ %h%m%r%{fugitive#statusline()}[%Y,%{&ff}]\ %=[ASCII=\%03.3b]\ [HEX=\%02.2B]\ %-14.(%l,%c%V%)\ %P
            "set statusline=%<%f\ %h%m%r%{fugitive#statusline()}[%Y,%{&ff}]\ %=[ASCII=\%03.3b]\ [HEX=\%02.2B]\ %-14.(%l,%c%V%)\ %P
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

" Key Mappings { "
    let mapleader = ","
    " Turn off highlight search
    "nmap <silent> ,n :set invhls:set hls?<cr>

    " Set Text wrapping toggles
    "nmap <silent> ,w :set invwrap:set wrap?<cr>

    " Open NERD Tree
    nmap <silent> <leader>nt :NERDTreeToggle<cr>

    " Save and reload the current file.
    nmap <silent> <leader>re :w <cr>:e %<cr>

    " Let's make it easy to edit this file (mnemonic for the key sequence is
    " 'e'dit 'v'imrc)
    nmap <silent> <leader>ev :e $MYVIMRC<cr>

    " And to source this file as well (mnemonic for the key sequence is
    " 's'ource 'v'imrc)
    nmap <silent> <leader>sv :so $MYVIMRC<cr>

    " Run the command that was just yanked
    nmap <silent> <leader>rc :@"<cr>

    " Underline the current line with '='
    nmap <silent> <leader>ul yypVr=


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
    noremap <silent> <leader>h :wincmd h<CR>
    noremap <silent> <leader>j :wincmd j<CR>
    noremap <silent> <leader>k :wincmd k<CR>
    noremap <silent> <leader>l :wincmd l<CR>
    noremap <silent> <leader>sb :wincmd p<CR>
    noremap <silent> <C-F9>  :vertical resize -10<CR>
    noremap <silent> <C-F10> :resize +10<CR>
    noremap <silent> <C-F11> :resize -10<CR>
    noremap <silent> <C-F12> :vertical resize +10<CR>
    noremap <silent> <leader>bn :bn<CR>
    noremap <silent> <leader>bp :bp<CR>
    noremap <silent> <leader>s8 :vertical resize 83<CR>
    noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
    noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
    noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
    noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
    noremap <silent> <leader>cc :close<CR>
    noremap <silent> <leader>cw :cclose<CR>
    noremap <silent> <leader>ml <C-W>L
    noremap <silent> <leader>mk <C-W>K
    noremap <silent> <leader>mh <C-W>H
    noremap <silent> <leader>mj <C-W>J
    noremap <silent> <C-7> <C-W>>
    noremap <silent> <C-8> <C-W>+
    noremap <silent> <C-9> <C-W>+
    noremap <silent> <C-0> <C-W>>
    noremap <silent> <leader>tt <C-W>T

    " Map command-[ and command-] to indenting or outdenting
    " while keeping the original selection in visual mode
    vmap <A-]> >gv
    vmap <A-[> <gv

    nmap <A-]> >>
    nmap <A-[> <<

    omap <A-]> >>
    omap <A-[> <<

    imap <A-]> <Esc>>>i
    imap <A-[> <Esc><<i
 
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e
    nmap <C-k> [e
    nmap <C-j> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv
    vmap <C-k> [egv
    vmap <C-j> ]egv

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    " Map Control-# to switch tabs
    map  <C-0> 0gt
    imap <C-0> <Esc>0gt
    map  <C-1> 1gt
    imap <C-1> <Esc>1gt
    map  <C-2> 2gt
    imap <C-2> <Esc>2gt
    map  <C-3> 3gt
    imap <C-3> <Esc>3gt
    map  <C-4> 4gt
    imap <C-4> <Esc>4gt
    map  <C-5> 5gt
    imap <C-5> <Esc>5gt
    map  <C-6> 6gt
    imap <C-6> <Esc>6gt
    map  <C-7> 7gt
    imap <C-7> <Esc>7gt
    map  <C-8> 8gt
    imap <C-8> <Esc>8gt
    map  <C-9> 9gt
    imap <C-9> <Esc>9gt

    " Move the current window forward (to the right) of the next window in the row
    nmap <silent> <leader>mf <C-W>r

    " Move the current window backwards (to the left) of the next window in the row
    nmap <silent> <leader>mb <C-W>R

    " Search the current file for what's currently in the search
    " register and display matches
    nmap <silent> <leader>gs
         \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

    " Search the current file for the word under the cursor and display matches
    nmap <silent> <leader>gw
         \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

    " Search the current file for the WORD under the cursor and display matches
    nmap <silent> <leader>gW
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
    
    " Map F1 to esc so pressing F1 doesn't open up help
    imap <F1> <esc>
" }

" Plugins {

    " closeTag {
      "autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
      "autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
    " }
    "
    " vimwiki {
        "let g:vimwiki_html_header_numbering = 2 " Number the headers
        "let wiki_cob = {}
        "let wiki_cob.path = '~/Dropbox/cob_wiki/'
        "let wiki_cob.html_template = ''
        "let wiki_cob.ext = '.md'
        "let wiki_cob.syntax: 'markdown'
        "let wiki_cob.nested_syntaxes = {
          "\ 'xml': 'xml',
          "\ 'javascript': 'javascript',
          "\ 'html': 'html',
          "\ 'python': 'python'
        "\ }

        "hi VimwikiHeader1 guifg=#ff5500 gui=bold
        "hi VimwikiHeader2 guifg=#b1d631 gui=bold
        "hi VimwikiHeader3 guifg=#7097B3 gui=bold
        "hi VimwikiHeader4 guifg=#ff9800
        "hi VimwikiHeader5 guifg=#b1d631
        "hi VimwikiHeader6 guifg=#7e8aa2

        "let g:vimwiki_list = [wiki_cob]
    " }

    " NERDTree {
        let NERDTreeMinimalUI = 1       "No need to show UI labels
        let NERDTreeShowBookmarks = 1
        let NERDTreeChDirMode = 2       "Change the CWD when root changes
        let NERDTreeHijackNetrw = 1     "Hijack Netrw
        let g:NERDShutUp=1
    " }

    " Syntastic {
        let g:syntastic_enable_signs = 1
        let g:syntastic_enable_highlighting = 1
    " }

    " Flake8 {
        autocmd BufWritePost *.py call Flake8()
    " }

    " NERDComment {
        "comment out line(s) in visual mode
        vmap  o  :call NERDComment(1, 'toggle')<CR>
    " }

    " Supertab {
        let g:SuperTabDefaultCompletionType = "context"
        set completeopt=menuone,longest,preview
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
        "if has("autocmd") && exists("+omnifunc")
            "autocmd Filetype *
                "\if &omnifunc == "" |
                "\setlocal omnifunc=syntaxcomplete#Complete |
                "\endif
        "endif

        "" Popup menu hightLight Group
        ""highlight Pmenu 	ctermbg=13 	guibg=DarkBlue
        "highlight PmenuSel 	ctermbg=7 	guibg=DarkBlue 		guifg=LightBlue
        ""highlight PmenuSbar ctermbg=7 	guibg=DarkGray
        ""highlight PmenuThumb 			guibg=Black

        "hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        "hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        "hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        "" some convenient mappings 
        "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        "inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        "inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        "inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        "inoremap <expr> <C-d> 	   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        "inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        "" automatically open and close the popup menu / preview window
        "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        "set completeopt=menu,longest,preview
    " }
    
    " Tagbar {
        " Ctags {
          set tags=./tags;/,~/.vimtags/
        " }
        let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
        nnoremap <silent> <C-SPACE> :TagbarToggle<CR>
        let g:tagbar_autofocus = 1
        let g:tagbar_compact = 1    "Don't show help at the top.
        let g:tagbar_autoshowtag = 1
        let g:tagbar_autoclose = 1
        let g:tagbar_type_extendscript = {
            \ 'kinds' : [
                \ 'v:global variables:0:0',
                \ 'c:classes',
                \ 'p:properties:0:0',
                \ 'm:methods',
                \ 'f:functions',
            \ ],
        \ }
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    " }

    " SnipMate {
        " Setting the author var
        let g:snips_author = 'Collin D. Brooks <collin.brooks@gmail.com>'
        " Shortcut for reloading snippets, useful when developing
        nnoremap <leader>smr <esc>:exec ReloadAllSnippets()<cr>
    " }

    " tagbar {
        "nnoremap <silent> <leader>,tb :TagbarToggle<CR>

        "let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
        "Let taglist handle extendscript files as javascript
        "let g:tagbar_type_extendscript= 'extendscript;c:classes;m:methods;p:properties;f:functions;v:variables'
    " }

    " pyDict {
        let g:pydiction_location = '$VIMRUNTIME/dictionaries/python/complete-dict' 
    " }

    " indent-guides {
        let g:indent_guides_color_change_percent = 2
        let g:indent_guides_enable_on_vim_startup = 0
        let g:indent_guides_guide_size = 0
        let g:indent_guides_start_level = 2
    " }

    " Ctrlp {
    let g:ctrlp_show_hidden = 1
    " }
    
    " Powerline {
    let g:Powerline_symbols = 'unicode'
    let g:Powerline_stl_path_style = 'relative'
    " }
    
    " PHPQA {
        let g:phpqa_messdetector_ruleset="~/Dropbox/dotfiles/.vim/phpqa/phpmd_rulesets/magento/magento-ruleset.xml"

        " Set the codesniffer args (default = "--standard=PHPCS")
        let g:phpqa_codesniffer_args = "--standard=Mage -n"

        " Don't run messdetector on save (default = 1)
        let g:phpqa_messdetector_autorun = 1

        " Don't run codesniffer on save (default = 1)
        let g:phpqa_codesniffer_autorun = 1

        " Show code coverage on load (default = 0)
        let g:phpqa_codecoverage_autorun = 1
    " }

    " BufferGator {

        let g:buffergator_split_size = 20
        let g:buffergator_viewport_split_policy = "B"
        let g:buffergator_autoexpand_on_split = 0
    " }

    " spf13/PIV {
    let g:pdv_cfg_Type = "mixed"
    let g:pdv_cfg_Package = "Webdav"
    let g:pdv_cfg_Version = "//autogen//"
    let g:pdv_cfg_Author = ""
    let g:pdv_cfg_Copyright = "Copyright (c) 2012 Elevate All rights reserved."
    let g:pdv_cfg_License = "PHP Version 5.3 {@link http://www.php.net/license/5_3.txt}"
    let g:PIVAutoClose = 1
    let g:PIVPearStyle = 1
    let g:DisableAutoPHPFolding = 1
    " }

" }

" Custom Functions {
" }

" Startup Settings {
    command! -n=0 Dumbq :%s/“/"/e | :s/”/"/e | :s/’/'/e
" }
