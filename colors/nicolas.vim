set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="nicolas"

hi CmdLine                              guibg=red
hi Cursor       guifg=snow              guibg=bisque4
hi CursorIM     guifg=bisque4    	    guibg=#000
hi CursorLine                           guibg=#222
hi DiffAdd      guifg=DarkOliveGreen1   guibg=grey15
hi DiffChange   guifg=PaleGreen         guibg=grey15
hi DiffDelete   guifg=red               guibg=grey15
hi DiffText     guifg=grey15            guibg=red
hi Directory    guifg=OliveDrab4        guibg=grey15
hi ErrorMsg     guifg=#C00              guibg=#000
hi FoldColumn   guifg=DarkOliveGreen2   guibg=grey30
hi Folded       guifg=DarkOliveGreen2   guibg=grey30
hi IncSearch    guifg=bisque            guibg=red
hi LineNr       guifg=#AAA              guibg=#222
hi ModeMsg      guifg=khaki3            guibg=grey15
hi MoreMsg      guifg=khaki3            guibg=grey15
hi NonText      guifg=#AAA              guibg=#111
hi Normal       guifg=#FFF              guibg=#000
hi Question     guifg=IndianRed         guibg=grey10
hi Search       guifg=grey15        	guibg=DarkSalmon
hi SignColumn 	guibg=grey15
hi SpecialKey   guifg=yellow            guibg=grey15
hi StatusLine   guifg=#F00              guibg=#000
hi StatusLineNC guifg=#F00              guibg=#000
hi Title        guifg=IndianRed         guibg=grey15
hi VertSplit    guifg=bisque4           guibg=DarkOliveGreen1
hi Visual       guifg=OliveDrab4        guibg=bisque1
hi WarningMsg   guifg=bisque            guibg=red
hi WildMenu     guifg=#FFF              guibg=#F00              gui=bold

"Syntax hilight groups

hi Boolean      	guifg=OliveDrab3
hi Character    	guifg=chocolate
hi Comment      	guifg=#555         
hi Conditional  	guifg=khaki
hi Constant     	guifg=khaki        
hi Debug        	guifg=brown
hi Define       	guifg=khaki1
hi Delimiter    	guifg=DarkGoldenrod
hi Error        	guifg=bisque          guibg=red
hi Exception    	guifg=khaki
hi Float        	guifg=chocolate
hi Function     	guifg=OliveDrab4
hi Identifier   	guifg=khaki4
hi Ignore       	guifg=grey30
hi Include      	guifg=khaki4
hi Keyword      	guifg=DarkKhaki
hi Label        	guifg=khaki
hi Macro        	guifg=khaki2
hi Number       	guifg=chocolate
hi Operator     	guifg=DarkKhaki
hi PreCondit    	guifg=khaki3
hi PreProc      	guifg=khaki4
hi Repeat       	guifg=khaki
hi Special      	guifg=IndianRed
hi SpecialChar  	guifg=DarkGoldenrod
hi SpecialComment   guifg=cornsilk
hi Statement    	guifg=khaki
hi StorageClass 	guifg=tan
hi String       	guifg=moccasin
hi Structure    	guifg=DarkGoldenrod
hi Tag          	guifg=DarkKhaki
hi Todo         	guifg=red             guibg=bisque
hi Type         	guifg=khaki3
hi Typedef      	guifg=khaki3
hi Underlined   	guifg=IndianRed
