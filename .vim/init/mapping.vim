"キーバインドの設定（vim本体）
" 参考：https://postd.cc/how-to-boost-your-vim-productivity/
" http://deris.hatenablog.jp/entry/2013/05/02/192415
" https://easyramble.com/vim-leader-space-vimrc.html

" Leader設定
" https://qiita.com/r12tkmt/items/b89df403f587216802f1
" 一番上にもっていかないと<Leader>が読み込まない
let g:mapleader = "\<Space>"

nnoremap <CR> A<CR><Esc>
nnoremap <silent><Esc><Esc> :nohlsearch<CR><Esc>
" デフォルトのLinuxでは<C-s>と<C-q>を割り当てることは出来ない。
" .bashrcの設定をいじった。
nnoremap <C-s> :w<CR>
nnoremap <C-w> :q!<CR>

" 削除のみブラックホールレジスタ
vnoremap d "_d
nnoremap d "_d
vnoremap D "_D
nnoremap D "_D
vnoremap x "_x
nnoremap x "_x
vnoremap s "_s
nnoremap s "_s

nnoremap <S-h>   0
nnoremap <S-j>   }
nnoremap <S-k>   {
nnoremap <S-l>   $
vnoremap <S-h>   0
vnoremap <S-j>   }
vnoremap <S-k>   {
vnoremap <S-l>   $
nnoremap j gj
nnoremap k gk
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <Leader>h gT
nnoremap <Leader>l gt
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" :term設定 「 E21: 'modifiable'がオフなので、変更できません」の回避>https://translate.google.com/translate?hl=ja&sl=en&u=https://github.com/vim/vim/issues/2216&prev=search&pto=aue
set termkey=<C-g>
tnoremap <silent><C-d> <C-g><S-n>
nnoremap <Leader><Leader> :term<CR>
