"=============================================================================
" Author:					Frédéric Hardy - http://blog.mageekbox.net
" Date:						Fri Sep 25 14:48:22 CEST 2009
" Licence:					BSD
"=============================================================================
if (!exists('atoum#disable') || atoum#disable <= 0) && !exists('b:atoum_loaded')
	let b:atoum_loaded = 1

	if &cp
		echomsg 'No compatible mode is required by atoum.vim'
	else
		let s:cpo = &cpo
		setlocal cpo&vim

		if !exists('g:atoum#configuration')
			let g:atoum#configuration = expand('<sfile>:h') . '/atoum.php'
		endif

		command -buffer -nargs=* -bang Atoum call atoum#run(expand('%'), '<bang>', '<args>')
		command -buffer -nargs=0 AtoumVimball call atoum#makeVimball()

		let &cpo = s:cpo
		unlet s:cpo
	endif
endif

finish
" vim:filetype=vim foldmethod=marker shiftwidth=3 tabstop=3
