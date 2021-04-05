"キーバインドの設定（vim本体）
" 参考：https://postd.cc/how-to-boost-your-vim-productivity/
" http://deris.hatenablog.jp/entry/2013/05/02/192415
" https://easyramble.com/vim-leader-space-vimrc.html

nnoremap <CR> A<CR><Esc>
nnoremap <silent><Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-s> :w<CR>
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
tnoremap <silent><Esc><Esc> <C-g><S-n>
tnoremap <silent><Esc><Esc> <C-g><S-n>:q!<CR>
tnoremap <silent><C-w> <C-g><S-n>:q!<CR>

" Leader設定
" https://qiita.com/r12tkmt/items/b89df403f587216802f1
let g:mapleader = "\<Space>"
