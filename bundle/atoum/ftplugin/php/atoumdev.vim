"=============================================================================
" Author:					Frédéric Hardy - http://blog.mageekbox.net
" Licence:					GPL version 2.0 license
"=============================================================================
augroup atoumdev
	au!
	au BufEnter ~/Atoum/repository/* lcd ~/Atoum/repository | cs add GTAGS
augroup end
