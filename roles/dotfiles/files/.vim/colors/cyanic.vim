" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Samuel Lampa <samuel.lampa@gmail.com>
" Last Change:	2015 Feb 2

hi clear
set background=light
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "cyanic"
hi Normal		  guifg=white guibg=black ctermfg=darkgrey
hi Scrollbar	  guifg=darkgrey guibg=grey
hi Menu			  guifg=white guibg=cyan ctermfg=white ctermbg=lightmagenta
hi Pmenu          guifg=white guibg=magenta ctermfg=White ctermbg=lightmagenta
hi SpecialKey	  ctermfg=darkred  guifg=#cc0000
hi NonText		  ctermfg=darkred  guifg=#cc0000
hi Directory	  ctermfg=brown  guifg=#cc8000
hi ErrorMsg		  term=standout    ctermfg=grey  ctermbg=red  guifg=White  guibg=Red
hi Search		  cterm=NONE  ctermfg=black  ctermbg=grey      guifg=white  guibg=Lightyellow
hi MoreMsg		  ctermfg=darkgreen	  guifg=SeaGreen
hi ModeMsg		    guifg=White	guibg=lightblue
hi LineNr		  term=underline    ctermfg=grey	guifg=grey
hi Question		  term=standout    ctermfg=darkgreen	  guifg=Green
hi StatusLine	  cterm=NONE ctermfg=darkgrey ctermbg=grey  guifg=blue guibg=white
hi StatusLineNC   cterm=NONE	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Title		  ctermfg=magenta  	guifg=Magenta
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout    ctermfg=red guifg=Red
hi Cursor		  guifg=bg	guibg=Green
hi Comment		  ctermfg=darkcyan guifg=#337733
hi Constant		  ctermfg=blue  guifg=#0000ff
hi Special		  ctermfg=darkyellow  guifg=Orange
hi Identifier	  ctermfg=blue guifg=white
hi Statement	  ctermfg=lightblue guifg=#0000ff
hi PreProc		  term=underline  ctermfg=blue guifg=#000099
hi Type			  term=underline   ctermfg=blue    guifg=#000099
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black  guifg=Red	guibg=Black
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  guifg=lightblue  guibg=Yellow
hi CursorLine	  term=underline  guibg=#555555 cterm=underline
hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
hi MatchParen	  term=reverse  ctermfg=lightblue guibg=lightblue
hi TabLine		  ctermfg=lightblue ctermbg=white  guifg=lightblue guibg=white
hi TabLineFill	  ctermfg=lightblue ctermbg=white  guifg=lightblue guibg=white
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi link IncSearch		Visual
hi String		ctermfg=magenta guifg=#990099
hi link Character		String
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi Operator             ctermfg=darkred
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			Keyword
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Operator
hi link SpecialComment	Special
hi link Debug			Special
