"キーバインドの設定（vim本体）
" 参考：https://postd.cc/how-to-boost-your-vim-productivity/
" http://deris.hatenablog.jp/entry/2013/05/02/192415
" https://easyramble.com/vim-leader-space-vimrc.html

nnoremap <CR> i<CR><Esc>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-w> :q!<CR>
"nnoremap x "_x

noremap <S-h>   0
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
noremap PP "0p
noremap j gj
noremap k gk
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

vnoremap <S-l>   $h" auto reload .vimrc

" :term設定 「 E21: 'modifiable'がオフなので、変更できません」の回避>https://translate.google.com/translate?hl=ja&sl=en&u=https://github.com/vim/vim/issues/2216&prev=search&pto=aue
set termkey=<C-g>
tnoremap <Esc><Esc> <C-g><S-n>
tnoremap <Esc><Esc> <C-g><S-n>:q!<CR>
tnoremap <C-w> <C-g><S-n>:q!<CR>

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
inoremap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
inoremap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"


" Leader設定
" https://qiita.com/r12tkmt/items/b89df403f587216802f1
let g:mapleader = "\<Space>"

