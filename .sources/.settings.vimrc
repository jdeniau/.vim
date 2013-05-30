call pathogen#infect()

" Détection de syntax
:syntax enable 

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.tplperso set filetype=smarty
au BufRead,BufNewFile *.twig setfiletype htmldjango
au BufRead,BufNewFile *.json setfiletype javascript

" TAILLE DE LA TABULATION 
:set expandtab
:set ts=4
:set shiftwidth=4
:set textwidth=0

" DÉSACTIVE LE BIP
:set vb t_vb=

"IGNORER LA CASSE POUR LES RECHERCHES
:set ignorecase

" NUMEROTATION DES LIGNES
:set number

" COMPATIBILITE AVEC VI DE BASE 
:set nocompatible

" RETOUR A LA LIGNE AUTOMATIQUE 
" :set nowrap

:set wildmenu
:set guioptions-=T 		" RETIRE LA BARRE D'OUTILS
:set guioptions-=m 		" RETIRE LA BARRE DE MENU
:set guioptions-=e 		" Tabs vi style (non-gtk)

" OPTIONS SPECIFIQUES AU PHP
:let php_mysql_query=1
:let php_folding=1

" APPLICATION APPELEE PAR LA COMMANDE :MAKE
:set makeprg=php\ -l\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l

" GERE L'INDENTATION DES LIGNES EN FONCTION DE LA PRECEDENTE
:set autoindent
:set smartindent

" FAIRE SAUTER UN CERTAIN NB DE LIGNE QUAND ON ARRIVE SUR UN BOUT D'ECRAN 
:set scrolljump=5
:set scrolloff=3

" DICTIONNARY PHP
set complete-=k complete+=k
set dictionary+=~/.vim/dictionary/PHP.dict

" CHAR ENCODING
" :set fileencoding=ISO-8859-1
:set fileencoding=utf-8

" FONT UTILISEE
:set gfn=Bitstream\ Vera\ Sans\ Mono\ 8

" IMPORTANT (CTE FOIS, C'EST VRAI :P) : DEFINI LE REPERTOIRE DE SWAP DE VIM
" A LAISSER DANS UN REP LOCAL POUR EVITER DE "POLLUER" MASTER AVEC DES .SWP QUAND ON EST EN SSHFS
:set nobackup
:set nowritebackup
:set directory=~/.vim/.backups

" persistant undo
if has("persistent_undo")
    :set undodir=~/.vim/.backups
    :set undofile
endif

:set showtabline=2

set hls

let g:pdv_cfg_Author = "Julien Deniau <julien.deniau@mapado.com>"

source ~/.vim/bundle/atoum/syntax/atoum.vim
source ~/.vim/bundle/atoum/ftplugin/php/atoum.vim

" phpDocumentator
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Author = "Julien Deniau <julien.deniau@mapado.com>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""

" TRES IMPORTANT : le theme de couleurs.... :p
": colo nicolas
:colo lucius

" Fonction permettant de switcher rapidement entre le linewrap ou non
func! ToggleWrap()
    if &wrap
        set nowrap
    else
        set wrap
    endif
endfunc

" on 'bind' la fonction sur la commande ,w
nmap <silent> ,w <Esc>:call ToggleWrap()<CR>

"recherche incrémentale
set incsearch

func! ToggleHLSearch()
    if &hls
        set nohls
        exe "echo 'Highlight OFF'"
    else
        set hls
        exe "echo 'Highlight ON'"
    endif
endfunc

nmap <silent> ,n <Esc>:call ToggleHLSearch()<CR>

func! ShiftTab(direction)
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
endfunc

" inoremap <silent> <C-S-h>  <C-r>=ShiftTab(0)<CR>
" inoremap <silent> <C-S-l>  <C-r>=ShiftTab(1)<CR>

:nnoremap <silent> <A-h>  :call ShiftTab(0)<CR>
:nnoremap <silent> <A-l> :call ShiftTab(1)<CR>

:nnoremap <C-l> gt
:nnoremap <C-h> gT


:imap <C-h> <Left>
:imap <C-l> <Right>
:imap <M-h> <Esc>


" RENVOI UNE COMMANDE TABULATION OU AUTO-COMPLETION EN FONCTION DES CARACTERES PRECEDENTS  
func! Taborcomplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunc

" bind sur tab de la fonction.
inoremap <Tab> <C-R>=Taborcomplete()<CR>




"pour eviter les tab incrementés lors des copiers collers
" :set paste
:set laststatus=2

if has("statusline")
	set statusline=%<%#StatusLineGit#%{fugitive#head()}%#StatusLine#\ %f\ %h%m%r%=\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %l,%c\ %P
	" set statusline=%<%#StatusLineGit#%{fugitive#statusline(\"[%b]\")}%#StatusLine#\ %f\ %h%m%r%=\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %l,%c\ %P
	" set statusline=%<%f\ %h%m%r%=%#StatusLineGit#%{fugitive#statusline(\"[%status%]\")}%#StatusLine#\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
	"set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif


set cursorline
hi CursorLine guibg=#111

set scrolloff=2
set foldcolumn=1

"Raccourci
vmap ,f :<C-U>!firefox "http://fr.php.net/<cword>" >& /dev/null<CR><CR>
vmap ,p :<C-U>!opera "http://www.php.net/manual-lookup.php?pattern=<cword>&scope=quickref" >& /dev/null<CR><CR>


"fonctionnement de la touche Home
:noremap <Home> ^
:inoremap <Home> <Esc>^i

" touches relou
:cnoremap Q :q
:cnoremap q: :q
:cnoremap W :w
:cnoremap w: :w
:cnoremap WQ :wq
:cmap wro %!sudo tee > /dev/null %


"TAGS PHP du projet
"nmap <silent> <F4>
"    \ :!ctags -f ~/.vim/tags
"    \ --langmap="php:+.inc"
"	\ --PHP-kinds=+cf-v
"	\ --exclude=photo
"	\ --exclude=backup
"	\ --exclude=style
"	\ --exclude=tmp
"	\ --exclude=temporaire
"	\ --exclude=xmlrpc
"	\ --exclude=nusoap
"	\ --exclude=geshi
"	\ --exclude=jpgraph
"	\ --exclude=m6wc
"	\ --languages=PHP
"    \ -h ".php.inc" -R --totals=yes
"    \ --tag-relative=yes ~/svn/ ~/ftp/<CR>
set tags=~/.vim/tags
"ouvre les tags dans un nouvel onglet
map <C-_> :tab tj <C-R>=expand("<cword>")<CR><CR>
map <C-LeftMouse> <LeftMouse> :tab tj <C-R>=expand("<cword>")<CR><CR>
map <C-]> <C-w><C-]>


"php Doc
inoremap <F6> <ESC>:call PhpDocSingle()<CR>i
nnoremap <F6> :call PhpDocSingle()<CR>
vnoremap <F6> :call PhpDocRange()<CR> 

"positionnement de la fenetre en full screen a droite
:winpos 0 0
":set lines=106
":set columns=148

" define a highlight colour group for bookmarks
let g:showmarks_enable = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_hlline_lower = 1
let g:showmarks_hlline_upper = 1
let g:showmarks_hlline_other = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=grey30
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=grey30
" For all other marks
highlight ShowMarksHLo gui=bold guibg=grey30
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=grey30

" undotree
nnoremap <silent> <F7> :UndotreeToggle<CR>

" Tag list
nnoremap <silent> <F8> :TlistToggle<CR>

imap <buffer> <F5> <C-O>:call PhpInsertUse()<CR>
map <buffer> <F5> :call PhpInsertUse()<CR>


" if $COLORTERM == 'gnome-terminal'
set t_Co=256
" endif
:source ~/.vim/.sources/.abbrevations.vimrc

