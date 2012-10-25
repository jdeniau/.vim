" Définition des :ab : abbreviation
" Associe une suite de char a une macro
" --------------------------------------------------------------------

	:ab jjj <script type="text/javascript"><CR>$(document).ready(function() {<CR>});<CR></script><up><up><Esc>o<Tab>
	:ab _style_ <style type="text/css"><CR><CR></style><up><tab>
	:ab _script_ <script type="text/javascript"><CR><CR></script><up><tab>
	:ab _scriptsrc_ <script type="text/javascript" src=""></script><left><left><left><left><left><left><left><left><left><left><left>
	:ab _sforeach_ {foreach from= item= }<CR><tab><CR><BS>{/foreach}<up><up><right><right><right><right>
	:ab author @author Julien DENIAU <jdeniau.externe@m6.fr>
	:ab ud Utils::display();<left><left>
	:ab kud \Krof\Utils\Utils::display();<left><left>
	:ab cl console.log();<left><left>
	



" Définition des :map
" --------------------------------------------------------------------

	:cab t tabe
	:cab encoding e ++enc=latin1 %:p
	:cab sf tabe ~/sshfs/dev.m6web.fr/api/site_factory/
	:cab sfm tabe ~/sshfs/dev.m6web.fr/api/site_factory/modules/
	:cab usf tabe ~/sshfs/dev.m6web.fr/usine/site_factory/
	:cab gc tabe ~/sshfs/dev.m6web.fr/galaxy/Core/
	:cab gm tabe ~/sshfs/dev.m6web.fr/galaxy/Models/
	:cab ga tabe ~/sshfs/dev.m6web.fr/galaxy/Apps/
	:cab aga tabe ~/sshfs/dev.m6web.fr/api/galaxy/apps/

    " cp (current project)
	:cab cpa tabe ~/sshfs/dev.m6web.fr/api/sdc/
	:cab cpg tabe ~/sshfs/dev.m6web.fr/sdc/src/


" Définition des :map
" --------------------------------------------------------------------

	" Onglet à gauche
	" :map <S-h> gT

	" Onglet à droite
	" :map <S-l> gt

	" Duplique la ligne en dessous
	" :map ci yyp

	" Duplique la ligne au dessus
	" :map cI yyP

	function ShiftTab(direction)
		 let tab_number = tabpagenr() 
		 if a:direction == 0
			 if tab_number == 1
				 exe 'tabm' . tabpagenr('$')
			 else
				 exe 'tabm' . (tab_number - 2)
			 endif
		 else
			 if tab_number == tabpagenr('$')
				 exe 'tabm ' . 0
			 else
				 exe 'tabm ' . tab_number
			 endif
		 endif
		 return ''
	endfunction

	" inoremap <silent> <C-S-h>  <C-r>=ShiftTab(0)<CR>
	" inoremap <silent> <C-S-l>  <C-r>=ShiftTab(1)<CR>

	:nnoremap <silent> <A-h>  :call ShiftTab(0)<CR>
	:nnoremap <silent> <A-l> :call ShiftTab(1)<CR>

	:nnoremap <C-l> gt
	:nnoremap <C-h> gT


	:imap <C-h> <Left>
	:imap <C-l> <Right>
	:imap <M-h> <Esc>
