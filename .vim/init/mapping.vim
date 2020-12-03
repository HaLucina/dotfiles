"キーバインドの設定（vim本体）
" 参考：https://postd.cc/how-to-boost-your-vim-productivity/
" http://deris.hatenablog.jp/entry/2013/05/02/192415

nnoremap <CR> A<CR><ESC>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap x "_x

noremap <S-h>   0
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
noremap PP "0p
noremap j gj
noremap k gk
" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

vnoremap <S-l>   $h" auto reload .vimrc

" Leader設定
" https://qiita.com/r12tkmt/items/b89df403f587216802f1
let g:mapleader = "\<Space>"

