"highlightとか色関連の設定

syntax on

augroup SetHybrid
	au!
	let g:hybrid_use_iTerm_colorg = 1
	set background=dark
augroup END

hi CursorLineNr term=bold cterm=NONE ctermfg=darkgreen ctermbg=NONE
hi clear CursorLine

" 行番号の色を設定
hi LineNr ctermbg=0 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine
