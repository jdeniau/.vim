"=============================================================================
" Author:					Frédéric Hardy - http://blog.mageekbox.net
" Licence:					BSD
"=============================================================================
if !exists('b:current_syntax')
	syn case match

	syntax match atoumFirstLevelTitle '^> .*\.\.\.$' contains=atoumFirstLevelPrompt
	syntax match atoumFirstLevelTitle '^> .\+\(:\)\@=:' contains=atoumFirstLevelPrompt
	syntax match atoumFirstLevelTitle '^> atoum .*$' contains=atoumFirstLevelPrompt
	highlight default atoumFirstLevelTitle guifg=Cyan ctermfg=Cyan

	syntax match atoumSecondLevelTitle '^=> .\+$' contains=atoumSecondLevelPrompt
	highlight default atoumSecondLevelTitle guifg=White ctermfg=White

	syntax match atoumFirstLevelPrompt '^> ' contained
	highlight default atoumFirstLevelPrompt guifg=White ctermfg=White

	syntax match atoumSecondLevelPrompt '^=> ' contained
	highlight default atoumSecondLevelPrompt guifg=Cyan ctermfg=Cyan

	syntax match atoumValue '\s\+\zs\d\+\(\.\d\+\)[^.]*.'
	syntax match atoumValue ' .\+$'
	highlight default atoumValue guifg=White ctermfg=White

	syntax region atoumTestDetails matchgroup=atoumFirstLevelPrompt start='^> .\+\.\.\.$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumTestTitle,atoumTestPrompt,AtoumTestTitle,AtoumTestResult

	syntax match atoumTestResult '.\+$' contained
	highlight default atoumTestResult guifg=White ctermfg=White

	syntax match atoumTestTitle '.\+\.\.\.$' contained
	highlight default atoumTestTitle guifg=LightBlue ctermfg=LightBlue

	syntax match atoumTestPrompt '^=> ' contained
	highlight default atoumTestPrompt guifg=LightBlue ctermfg=LightBlue

	syntax match atoumTestTitle '.\+:' contained
	highlight default atoumTestTitle guifg=LightBlue ctermfg=LightBlue

	syntax region atoumFailureDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ failures\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumFailureTitle,atoumFailurePrompt,atoumFailureMethod,atoumFailureDescription,diffRemoved,diffAdded,diffSubname,diffLine

	syntax match atoumFailureMethod '.\+\(::\)\@!:$' contained
	highlight default atoumFailureMethod guifg=Red ctermfg=Red

	syntax match atoumFailureTitle 'There \(is\|are\) \d\+ failures\?:$' contained
	highlight default atoumFailureTitle guifg=Red ctermfg=Red

	syntax match atoumFailureDescription '^.*$' contained
	highlight default atoumFailureDescription guifg=White ctermfg=White

	syntax match atoumFailurePrompt '^=> ' contained
	highlight default atoumFailurePrompt guifg=Red ctermfg=Red

	syntax region atoumErrorDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ errors\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumErrorTitle,atoumErrorMethodPrompt,atoumErrorMethod,atoumErrorDescriptionPrompt,atoumErrorDescription,atoumErrorValue

	syntax match atoumErrorValue '^.*$' contained
	highlight default atoumErrorValue guifg=White ctermfg=White

	syntax match atoumErrorDescription 'Error .\+:$' contained
	highlight default atoumErrorDescription guifg=Yellow ctermfg=Yellow

	syntax match atoumErrorMethod '.\+::.\+():$' contained
	highlight default atoumErrorMethod guifg=Yellow ctermfg=Yellow

	syntax match atoumErrorTitle 'There \(is\|are\) \d\+ errors\?:$' contained
	highlight default atoumErrorTitle guifg=Yellow ctermfg=Yellow

	syntax match atoumErrorMethodPrompt '^=> ' contained
	highlight default atoumErrorMethodPrompt guifg=Yellow ctermfg=Yellow

	syntax match atoumErrorDescriptionPrompt '^==> ' contained
	highlight default atoumErrorDescriptionPrompt guifg=Yellow ctermfg=Yellow

	syntax region atoumUncompletedMethodDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ uncompleted methods\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumUncompletedMethodTitle,atoumUncompletedMethodMethodPrompt,atoumUncompletedMethodMethod,atoumUncompletedMethodDescriptionPrompt,atoumUncompletedMethodDescription,atoumUncompletedMethodOutput

	syntax match atoumUncompletedMethodOutput '.*$' contained
	highlight default atoumUncompletedMethodOutput guifg=White ctermfg=White

	syntax match atoumUncompletedMethodDescription '.\+::.\+() with exit code [^:]\+:' contained
	highlight default atoumUncompletedMethodDescription guifg=Brown ctermfg=Brown

	syntax match atoumUncompletedMethodMethod '.\+::.\+():$' contained
	highlight default atoumUncompletedMethodMethod guifg=Brown ctermfg=Brown

	syntax match atoumUncompletedMethodTitle 'There \(is\|are\) \d\+ uncompleted methods\?:$' contained
	highlight default atoumUncompletedMethodTitle guifg=Brown ctermfg=Brown

	syntax match atoumUncompletedMethodMethodPrompt '^=> ' contained
	highlight default atoumUncompletedMethodMethodPrompt guifg=Brown ctermfg=Brown

	syntax match atoumUncompletedMethodDescriptionPrompt '^==> ' contained
	highlight default atoumUncompletedMethodDescriptionPrompt guifg=Brown ctermfg=Brown

	syntax region atoumVoidDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ void methods\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumVoidTitle,atoumVoidMethodPrompt,atoumVoidMethod,atoumVoidDescriptionPrompt

	syntax match atoumVoidMethod '.\+::.\+()$' contained
	highlight default atoumVoidMethod guifg=White ctermfg=White

	syntax match atoumVoidTitle 'There \(is\|are\) \d\+ void methods\?:$' contained
	highlight default atoumVoidTitle guifg=Blue ctermfg=Blue

	syntax match atoumVoidMethodPrompt '^=> ' contained
	highlight default atoumVoidMethodPrompt guifg=Blue ctermfg=Blue

	syntax region atoumSkippedDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ skipped methods\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumSkippedTitle,atoumSkippedMethodPrompt,atoumSkippedMethod,atoumSkippedDescriptionPrompt

	syntax match atoumSkippedMethod '.\+::.\+()$' contained
	highlight default atoumSkippedMethod guifg=DarkGrey ctermfg=White

	syntax match atoumSkippedTitle 'There \(is\|are\) \d\+ skipped methods\?:$' contained
	highlight default atoumSkippedTitle guifg=DarkGrey ctermfg=DarkGrey

	syntax match atoumSkippedMethodPrompt '^=> ' contained
	highlight default atoumSkippedMethodPrompt guifg=DarkGrey ctermfg=DarkGrey

	syntax region atoumExceptionDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ exceptions\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumExceptionTitle,atoumExceptionMethodPrompt,atoumExceptionMethod,atoumExceptionDescriptionPrompt,atoumExceptionDescription

	syntax match atoumExceptionDescription '.*$' contained
	highlight default atoumExceptionDescription guifg=White ctermfg=White

	syntax match atoumExceptionMethod '.\+::.\+():$' contained
	syntax match atoumExceptionMethod 'Exception throwed in .\+ on line \d\+:' contained
	highlight default atoumExceptionMethod guifg=Magenta ctermfg=Magenta

	syntax match atoumExceptionTitle 'There \(is\|are\) \d\+ exceptions\?:$' contained
	highlight default atoumExceptionTitle guifg=Magenta ctermfg=Magenta

	syntax match atoumExceptionMethodPrompt '^=> ' contained
	highlight default atoumExceptionMethodPrompt guifg=Magenta ctermfg=Magenta

	syntax match atoumExceptionDescriptionPrompt '^==> ' contained
	highlight default atoumExceptionDescriptionPrompt guifg=Magenta ctermfg=Magenta

	syntax region atoumCoverageDetails matchgroup=atoumFirstLevelPrompt start='^> Code coverage value:.\+$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumCoverageTitle,atoumCoverageClassPrompt,atoumCoverageMethodPrompt,atoumCoverageValue,atoumCoverageClass,atoumCoverageMethod

	syntax match atoumCoverageValue '.*$' contained
	highlight default atoumCoverageValue guifg=White ctermfg=White

	syntax match atoumCoverageTitle '.\+:' contained
	highlight default atoumCoverageTitle guifg=Green ctermfg=Green

	syntax match atoumCoverageClass 'Class .\+:' contained
	highlight default atoumCoverageClass guifg=Green ctermfg=Green

	syntax match atoumCoverageMethod '.\+::.\+():' contained
	highlight default atoumCoverageMethod guifg=Green ctermfg=Green

	syntax match atoumCoverageClassPrompt '^=> ' contained
	highlight default atoumCoverageClassPrompt guifg=Green ctermfg=Green

	syntax match atoumCoverageMethodPrompt '^==> ' contained
	highlight default atoumCoverageMethodPrompt guifg=Green ctermfg=Green

	syntax region atoumOutputDetails matchgroup=atoumFirstLevelPrompt start='^> There \(is\|are\) \d\+ outputs\?:$'rs=s+2 end="^\(> \|/\*\)"me=s-2 contains=atoumFirstLevelPrompt,atoumOutputTitle,atoumOutputPrompt,atoumOutputMethod,atoumOutputDescription,diffRemoved,diffAdded,diffSubname,diffLine

	syntax match atoumOutputMethod '.\+\(::\)\@!:$' contained
	highlight default atoumOutputMethod guifg=Gray ctermfg=Gray

	syntax match atoumOutputTitle 'There \(is\|are\) \d\+ outputs\?:$' contained
	highlight default atoumOutputTitle guifg=Gray ctermfg=Gray

	syntax match atoumOutputDescription '^.*$' contained
	highlight default atoumOutputDescription guifg=White ctermfg=White

	syntax match atoumOutputPrompt '^=> ' contained
	highlight default atoumOutputPrompt guifg=Gray ctermfg=Gray

	syntax match atoumSuccess '^Success ([^)]\+) !'
	highlight default atoumSuccess term=bold cterm=bold guifg=White guibg=DarkGreen ctermfg=White ctermbg=DarkGreen

	syntax match atoumFailure '^Failure ([^)]\+) !'
	highlight default atoumFailure term=bold cterm=bold guifg=White guibg=DarkRed ctermfg=White ctermbg=DarkRed

	syntax match diffRemoved	"^-.*"
	syntax match diffAdded	"^+.*"

	syntax match diffSubname	" @@..*"ms=s+3 contained
	syntax match diffLine	"^@.*" contains=diffSubname
	syntax match diffLine	"^\<\d\+\>.*"
	syntax match diffLine	"^\*\*\*\*.*"

	highlight default link diffRemoved Special
	highlight default link diffAdded Identifier
	highlight default link diffSubname PreProc
	highlight default link diffLine Statement

	let b:current_syntax = "atoum"
endif
" vim:filetype=vim foldmethod=marker shiftwidth=3 tabstop=3
