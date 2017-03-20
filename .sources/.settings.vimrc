:set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle
" required! 
"if exists("*vundle#begin")
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    " My bundles
    Plugin 'tpope/vim-fugitive'

    Plugin 'vim-scripts/taglist.vim'
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'mbbill/undotree'
    Plugin 'scrooloose/syntastic'

    " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    " PHP
    Plugin 'spf13/PIV'
    "Plugin 'vexxor/phpdoc.vim'
    Plugin 'arnaud-lb/vim-php-namespace'
    Plugin 'vim-coffee-script'
    Plugin 'joonty/vdebug'

    " HTML5
    Plugin 'elzr/vim-json'
    Plugin 'groenewege/vim-less'
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'beyondwords/vim-twig'
    Plugin 'digitaltoad/vim-jade'

    "Plugin 'spf13/vim-autoclose'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'spf13/vim-colors'

    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'stephpy/vim-php-cs-fixer'

    if executable('ack-grep')
        let g:ackprg="ack-grep -H --nocolor --nogroup --column"
        Plugin 'mileszs/ack.vim'
    elseif executable('ack')
        Plugin 'mileszs/ack.vim'
    elseif executable('ag')
        Plugin 'mileszs/ack.vim'
        let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    endif
    call vundle#end()
"else
"    echo 'begin exists no'
"endif

"php Doc
inoremap <F6> <ESC>:call PhpDoc()<CR>i
nnoremap <F6> :call PhpDoc()<CR>
vnoremap <F6> :call PhpDoc()<CR>

map <F1> <Esc>
imap <F1> <Esc>


let mapleader=","




"call pathogen#infect()

" General
filetype plugin indent on
syntax on

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

set history=1000 " 100 history (default is 20)
set nospell " spell checking off

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
au BufRead,BufNewFile Jenkinsfile setfiletype groovy


" Backup
set backup
set writebackup
set backupdir=~/.vim/.backups
set directory=~/.vim/.backups
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    set undodir=~/.vim/.backups
endif


" UI
" if $COLORTERM == 'gnome-terminal'
set t_Co=256
" endif
colorscheme jdeniau
" colorscheme lucius
" LuciusBlack

set showmode
set cursorline
" hi CursorLine guibg=#111

if has("statusline")
	set statusline=%<%#StatusLineGit#%{fugitive#head()}%#StatusLine#\ [%{getcwd()}]\ %f\ %h%m%r%=\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %l,%c\ %P
	" set statusline=%<%#StatusLineGit#%{fugitive#statusline(\"[%b]\")}%#StatusLine#\ %f\ %h%m%r%=\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %l,%c\ %P
	" set statusline=%<%f\ %h%m%r%=%#StatusLineGit#%{fugitive#statusline(\"[%status%]\")}%#StatusLine#\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
	"set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif


set backspace=indent,eol,start  " Backspace for dummies"
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set wildignorecase              " Case insensitive command line
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set guioptions-=T 		        " no toolbar
set guioptions-=m 		        " no menubar
set guioptions-=e 		        " Tabs vi style (non-gtk)
"set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set wildmode=full               " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace"

set foldcolumn=1


" Formatting {
    " set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_keep_trailing_whitespace = 1
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell setlocal nospell

    " Javascript airbnb convention
    autocmd BufRead,BufEnter .babelrc,.eslintrc set filetype=javascript
    autocmd FileType javascript  setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldcolumn=0

    " jsx file not required to do JSX
    let g:jsx_ext_required = 0
" }

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$"

" Visual shifting (does not exit Visual mode)
" vnoremap < <gv
" vnoremap > >gv

" Sudo save
:cmap wro %!sudo tee > /dev/null %

" Plugins {
    " PIV {
        let g:DisableAutoPHPFolding = 1
        let g:PIVAutoClose = 0

    " }
    " SnipMate {
        " Setting the author val
        " If forking, please overwrite in your .vimrc.local file
        let g:snips_author = 'Julien Deniau <julien.deniau@mapado.com>'
    " }"

    " Undotree {
        nnoremap <silent> <F7> :UndotreeToggle<CR>

        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle = 1
    " }

    " Tag list {
        nnoremap <silent> <F8> :TlistToggle<CR>
    " }

    " Json {
        let g:vim_json_syntax_conceal = 0
    " }
" }

" Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
    call cursor(l, c)
        endfunction
" }

" GUI
:set gfn=Bitstream\ Vera\ Sans\ Mono\ 8

























"au BufNewFile,BufRead *.less set filetype=less
"au BufRead,BufNewFile *.twig setfiletype htmldjango
"au BufRead,BufNewFile *.json setfiletype javascript

" TAILLE DE LA TABULATION 
:set textwidth=0

" DÉSACTIVE LE BIP
:set vb t_vb=

" RETOUR A LA LIGNE AUTOMATIQUE 
" :set nowrap

" OPTIONS SPECIFIQUES AU PHP
":let php_mysql_query=1
":let php_folding=1

" APPLICATION APPELEE PAR LA COMMANDE :MAKE
":set makeprg=php\ -l\ %
":set errorformat=%m\ in\ %f\ on\ line\ %l

" Indentation
":set smartindent

" DICTIONNARY PHP
set complete-=k complete+=k
set dictionary+=~/.vim/dictionary/PHP.dict

" CHAR ENCODING
" :set fileencoding=ISO-8859-1
":set fileencoding=utf-8

" FONT UTILISEE



"set showtabline=2

"let g:pdv_cfg_Author = "Julien Deniau <julien.deniau@mapado.com>"
"
"source ~/.vim/bundle/atoum/syntax/atoum.vim
"source ~/.vim/bundle/atoum/ftplugin/php/atoum.vim
"
"" phpDocumentator
"let g:pdv_cfg_Version = ""
"let g:pdv_cfg_Author = "Julien Deniau <julien.deniau@mapado.com>"
"let g:pdv_cfg_Copyright = ""
"let g:pdv_cfg_License = ""



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

func! ToggleLeftColumns()
    if &number
        set nonumber
        set foldcolumn=0
        GitGutterDisable
        exe "echo 'Left columns OFF'"
    else
        set number
        set foldcolumn=1
        GitGutterEnable
        exe "echo 'Left columns ON'"
    endif
endfunc

nmap <silent> ,f <Esc>:call ToggleLeftColumns()<CR>

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
"func! Taborcomplete()
"    let col = col('.')-1
"    if !col || getline('.')[col-1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<C-N>"
"    endif
"endfunc

" bind sur tab de la fonction.
" inoremap <Tab> <C-R>=Taborcomplete()<CR>




"pour eviter les tab incrementés lors des copiers collers
" :set paste
:set laststatus=2


" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif




"Raccourci
vmap ,f :<C-U>!firefox "http://fr.php.net/<cword>" >& /dev/null<CR><CR>
vmap ,p :<C-U>!opera "http://www.php.net/manual-lookup.php?pattern=<cword>&scope=quickref" >& /dev/null<CR><CR>


"fonctionnement de la touche Home
:noremap <Home> ^
:inoremap <Home> <Esc>^i

" touches relou
:map <S-Insert> <MiddleMouse>
:map! <S-Insert> <MiddleMouse>


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

""imap <buffer> <F5> <C-O>:call PhpInsertUse()<CR>
""map <buffer> <F5> :call PhpInsertUse()<CR>

" Syntastic checkers
let g:syntastic_php_checkers = ['php7.0', 'phpcs', 'phpmd']
let g:syntastic_php_phpmd_exec = './vendor/phpmd/phpmd/src/bin/phpmd'
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1

let g:syntastic_php_phpcs_args = "--standard=PSR2"


:source ~/.vim/.sources/.abbrevations.vimrc
