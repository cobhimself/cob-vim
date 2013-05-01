" GUI Options {

	" Use 11pt Menlo
	set guifont=Menlo:h12

	" Better line-height
	set linespace=4

	" Give access to the menu items within the console
	so $VIMRUNTIME/menu.vim
	set cpo-=<
	set wcm=<C-Z>
	map <C-CR> :emenu <C-Z>

	set mouse=a                     " automatically enable mouse usage

	" Setup the general guioptions
	set guioptions+=c               " Don't show gui popups, put them in the console.
	set guioptions-=r               " No right hand scrollbar.
	set guioptions-=l               " No left hand scrollbar.
	set guioptions-=b               " No bottom hand scrollbar.

	" Set up the gui cursor to look nice
	set guicursor=n-v-c:block-Cursor-blinkon0
	set guicursor+=ve:ver35-Cursor
	set guicursor+=o:hor50-Cursor
	set guicursor+=i-ci:ver25-Cursor
	set guicursor+=r-cr:hor20-Cursor
	set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" }

" Key Mappings { "
	" Map command-[ and command-] to indenting or outdenting
	" while keeping the original selection in visual mode
	vmap <D-]> >gv
	vmap <D-[> <gv

	nmap <D-]> >>
	nmap <D-[> <<

	omap <D-]> >>
	omap <D-[> <<

	imap <D-]> <Esc>>>i
	imap <D-[> <Esc><<i

	" Bubble single lines
	nmap <D-Up> [e
	nmap <D-Down> ]e
	nmap <D-k> [e
	nmap <D-j> ]e

	" Bubble multiple lines
	vmap <D-Up> [egv
	vmap <D-Down> ]egv
	vmap <D-k> [egv
	vmap <D-j> ]egv

	" Map Command-# to switch tabs
	map  <D-0> 0gt
	imap <D-0> <Esc>0gt
	map  <D-1> 1gt
	imap <D-1> <Esc>1gt
	map  <D-2> 2gt
	imap <D-2> <Esc>2gt
	map  <D-3> 3gt
	imap <D-3> <Esc>3gt
	map  <D-4> 4gt
	imap <D-4> <Esc>4gt
	map  <D-5> 5gt
	imap <D-5> <Esc>5gt
	map  <D-6> 6gt
	imap <D-6> <Esc>6gt
	map  <D-7> 7gt
	imap <D-7> <Esc>7gt
	map  <D-8> 8gt
	imap <D-8> <Esc>8gt
	map  <D-9> 9gt
	imap <D-9> <Esc>9gt
" }

" Startup settings {

	" Auto Full Screen Mode
    if has("gui_running")
        set fuoptions=maxvert,maxhorz
        au GUIEnter * set fullscreen
    endif

    "Load NERDTree on startup
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
" }
