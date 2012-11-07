""
"" Helpers
""

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

""
"" File types
""

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

	augroup xml
		au BufRead,BufNewFile *.xml set filetype=xml
	augroup END

	augroup extendscript
		au BufRead,BufNewFile *.jsx,*.jsxinc set filetype=extendscript
		au BufRead *.jsx,*.jsxinc setlocal dictionary=$HOME/.vim/dictionaries/extendscript/*
		au BufRead,BufNewFile *.jsx,*.jsxinc set comments=sr:/*,mb1:*,exr:*/,sr:/**,mb1:*,exr:*/,://
		au BufNewFile *.jsx,*.jsxinc 0r ~/.vim/skeletons/skeleton.jsx
	augroup END

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g`\"" | endif
  
endif
