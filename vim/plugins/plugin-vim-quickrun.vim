" vim-quickrunがpandocに文章を渡すための設定
" [https://kawahara-zakki.com/vim-markdown/]
let g:quickrun_config = {}
let g:quickrun_config = {
      \ "markdown" :{
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-f markdown+hard_line_breaks'
      \}
\}
