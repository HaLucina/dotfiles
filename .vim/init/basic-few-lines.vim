" augroupや複数行のコマンドからなる設定を集めたもの

"""""""""""" 補完ウィンドウの設定
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
"""""""""""" 補完ウィンドウの設定 End

""""""
augroup source-vimrc
  au!
  au BufWritePost *vimrc source $MYVIMRC
  au BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
""""""""""""


"""""" auto comment off
augroup auto_comment_off
  au!
  au BufEnter * setlocal formatoptions-=r
  au BufEnter * setlocal formatoptions-=o
augroup END
""""""""""""


"""""" HTML/XML閉じタグ自動補完
augroup MyXML
  au!
  au Filetype xml inoremap <buffer> </ </<C-x><C-o>
  au Filetype html inoremap <buffer> </ </<C-x><C-o>
  au Filetype markdown inoremap <buffer> </ </<C-x><C-o>
augroup END
""""""""""""


"""""" 全角スペースのハイライト設定
" 参考[https://oki2a24.com/2019/02/22/attention-when-visualizing-double-byte-space-with-vim-and-error-when-failing/]
scriptencoding utf-8
augroup highlightIdegraphicSpace
  au!
  au Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  au VimEnter,WinEnter * match IdeographicSpace /　/ 
augroup END
colorscheme default
""""""""""""


"""""" auto fcitx(挿入モードからコマンドモードになった時、自動的に半角英数にする)
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction
 
set timeout timeoutlen=3000 ttimeoutlen=100 "元々は set ttimeoutlen=150
au InsertLeave * call Fcitx2en()
""""""""""""
