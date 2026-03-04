" open-browser 設定
" [https://easyramble.com/open-url-with-browser-from-vim.html]
let g:netrw_nogx = 1 " disable netrw's gx mapping.
" nnoremap,vnoremapではコマンドは動かない
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
