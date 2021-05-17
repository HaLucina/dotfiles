"キーバイン の設定（vim本体）
" 参考：http://postd.cc/how-to-boost-your-vim-productivity/
" http://deris.hatenablog.jp/entry/2013/05/02/192415
" https://easyramble.com/vim-leader-space-vimrc.html
" https://qiita.com/itmammoth/items/312246b4b7688875d023

" Leader設定
" https://qiita.com/r12tkmt/items/b89df403f587216802f1
" 一番上にもっていかないと<Leader>が読み込まない
let g:mapleader = "\<Space>"

".vimrcを開く: <Space>e.
nnoremap <Leader>e. :<C-u>edit $MYVIMRC<Enter>
".vimrcを反映: <Space>s.
nnoremap <Leader>s. :<C-u>source $MYVIMRC<Enter>

nnoremap <CR> A<CR><Esc>
nnoremap O O<Esc>
nnoremap <silent><Esc><Esc> :nohlsearch<CR><Esc>

" デフォルトのLinuxでは<C-s>と<C-q>を割り当てることは出来ない。
" .bashrcの設定をいじった。
nnoremap <C-s> :<C-u>w<CR>
nnoremap <C-q> :<C-u>q!<CR>

" 削除のみブラックホールレジスタ
vnoremap x "_x
nnoremap x "_x
vnoremap s "_s
nnoremap s "_s

inoremap <C-d> <Del>
inoremap <C-h> <BS>

"カーソル下の単語をハイライトする
nnoremap <silent> <C-f> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nnoremap <C-h> <C-f>:%s/<C-r>///g<Left><Left>

function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction
xnoremap <silent> <Space> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap <C-f> :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap <C-h> <Space>:%s/<C-r>///g<Left><Left>

nnoremap <silent><C-l> <C-u>:e!<CR>
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
nnoremap S <Nop>
nnoremap q <Nop>
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap <silent><Leader>y "+y
vnoremap <silent><Leader>d "+d
nnoremap <silent><Leader>p "+p
nnoremap <silent><Leader>P "+P
vnoremap <silent><Leader>p "+p
vnoremap <silent><Leader>P "+P
nnoremap <silent><Leader>h :wincmd h<CR>
nnoremap <silent><Leader>l :wincmd l<CR>

" ESC to jj
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>

"vimコマンドラインのカーソル移動
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

xnoremap p "_xP

" 行を移動
nnoremap <C-k> "zdd<Up>"zP
nnoremap <C-j> "zdd"zp

" 複数行を移動
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]

if has('nvim')
	"https://zenn.dev/ryo_kawamata/articles/improve-neovmi-terminal
	tnoremap <silent><C-d> <C-\><C-n>
	nnoremap <Leader><Leader> :wincmd l<CR>:<C-u>split<CR>:wincmd j<CR>:resize 20<CR>:terminal<CR>
	autocmd TermOpen * startinsert	
"	nnoremap <Leader><Leader> :<C-u>split | :<C-u>wincmd j | :<C-u>resize 20 | :<C-u>terminal
else
	" :term設定 「 E21: 'modifiable'がオフなので、変更できません」の回避>https://translate.google.com/translate?hl=ja&sl=en&u=https://github.com/vim/vim/issues/2216&prev=search&pto=aue
" vimのver8.0>8.2にupdateした際に「未知のオプションが発生しました」と出た。termkeyをtermwinkeyに変更すると直った。>https://vim-jp.org/vimmagazine/2018/04/30/vimmagazine.html」
	set termwinkey=<C-g>
	tnoremap <silent><C-d> <C-g><S-n>
	nnoremap <Leader><Leader> :<C-u>term<CR>
endif


