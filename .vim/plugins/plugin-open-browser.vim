" open-browser 設定
" [https://easyramble.com/open-url-with-browser-from-vim.html]
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nnoremap gx <Plug>(openbrowser-smart-search)
vnoremap gx <Plug>(openbrowser-smart-search)
