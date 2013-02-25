"=============================================================================
" Author:					Frédéric Hardy - http://blog.mageekbox.net
" Date:						Fri Sep 25 14:29:10 CEST 2009
" Licence:					BSD
"=============================================================================
if !exists('g:atoum#php')
	let g:atoum#php = 'php'
endif
if !exists('g:atoum#_')
	let g:atoum#_ = ''
endif
"run {{{1
function atoum#run(file, bang, args)
	let _ = a:bang != '' ? g:atoum#_ : g:atoum#php . ' -f ' . a:file . ' -- -c ' . g:atoum#configuration

	if (_ != '')
		let g:atoum#_ = _
		let g:atoum#cursorline = &cursorline
		let bufnr = bufnr('%')
		let winnr = bufwinnr('^' . _ . '$')

		execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'

		set filetype=atoum
		setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber nocursorline

		%d _

		let message = 'Execute ' . _ . '...'

		call append(0, message)

		echo message

		2d _ | resize 1 | redraw

		execute 'silent! %!' . _ . ' ' . a:args
		execute 'resize ' . line('$')
		execute 'nnoremap <silent> <buffer> <CR> :call atoum#run(''' . a:file . ''', '''', ''' . a:args . ''')<CR>'
		execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'

		nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
		nnoremap <silent> <buffer> <LocalLeader><CR> :call atoum#goToFailure(getline('.'))<CR>

		augroup atoum
		au!
		execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
		execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
		autocmd BufEnter <buffer> let g:atoum#cursorline = &cursorline | set nocursorline | call atoum#highlightStatusLine()
		autocmd BufLeave <buffer> if (g:atoum#cursorline) | set cursorline | endif
		autocmd BufWinLeave <buffer> au! atoum
		augroup end

		let g:atoum#success = search('^Success ', 'w')

		if (g:atoum#success > 0)
			execute g:atoum#success
		else
			let result = getline(1, '$')

			let oldErrorFormat = &errorformat

			let &errorformat = 'In\ file\ %f\ on\ line\ %l\,\ %m'

			cgete filter(result, 'v:val =~ "^In file "')

			let &errorformat = oldErrorFormat

			let failure = search('^Failure ', 'w')

			if (failure > 0)
				execute failure
			endif
		endif

		call atoum#highlightStatusLine()
	endif
endfunction
"defineConfiguration {{{1
function atoum#defineConfiguration(directory, configuration, extension)
	augroup atoumConfiguration
	silent! execute 'au BufEnter *' . a:extension . ' if (expand(''%:p'') =~ ''^' . a:directory . ''') | let g:atoum#configuration = ''' . a:configuration . ''' | endif'
	augroup end
endfunction
"goToFailure {{{1
function atoum#goToFailure(line)
	let pattern = 'In file \(\f\+\) on line \(\d\+\).*$'

	if (matchstr(a:line, pattern) != '')
		execute bufwinnr('^' . substitute(a:line, pattern, '\1', '') . '$') . 'wincmd w'
		execute substitute(a:line, pattern, '\2', '')
		wincmd _
	endif
endfunction
"makeVimball {{{1
function atoum#makeVimball()
	split atoumVimball

	setlocal bufhidden=delete
	setlocal nobuflisted
	setlocal noswapfile

	let files = 0

	for file in split(globpath(&runtimepath, '**/atoum*'), "\n")
		for runtimepath in split(&runtimepath, ',')
			if file =~ '^' . runtimepath
				if getftype(file) != 'dir'
					let files += 1
					call setline(files, substitute(file, '^' . runtimepath . '/', '', ''))
				else
					for subFile in split(glob(file . '/**'), "\n")
						if getftype(subFile) != 'dir'
							let files += 1
							call setline(files, substitute(subFile, '^' . runtimepath . '/', '', ''))
						endif
					endfor
				endif
			endif
		endfor
	endfor

	try
		execute '%MkVimball! atoum'

		setlocal nomodified
		bwipeout

		echomsg 'Vimball is in ''' . getcwd() . ''''
	catch /.*/
		call atoum#displayError(v:exception)
	endtry
endfunction
"highlightStatusLine {{{1
function atoum#highlightStatusLine()
	if g:atoum#success
		hi statusline guibg=DarkGreen guifg=White gui=NONE
	else
		hi statusline guibg=DarkRed guifg=White gui=NONE
	endif
endfunction
"displayError {{{1
function atoum#displayError(error)
	echohl ErrorMsg
	echomsg a:error
	echohl None
endfunction
" vim:filetype=vim foldmethod=marker shiftwidth=3 tabstop=3
