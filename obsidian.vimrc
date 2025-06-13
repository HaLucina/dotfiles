" let mapleader
unmap <Space>

" Yank to system clipboard
set clipboard=unnamed

" remap esc key
imap kj <Esc>
imap jk <Esc>
imap jj <Esc>

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" I like using H and L for beginning/end of line
nmap H ^
nmap L $
nmap J }
nmap K {

vmap H ^
vmap L $
vmap J }
vmap K {


" 半ページスクロール（Ctrl+d/u）や検索移動（n/N）後、カーソル位置を常に画面中央に保ちます。見失い防止。
noremap <c-d> <C-d>zz
noremap <c-u> <C-u>zz
noremap <n> nzzzv
noremap <N> Nzzzv



" Obsidian のコマンドを Vim のキーマップで呼び出し、ノート内の折りたたみ/展開を素早く操作できます。
" zR すべて展開
" zM すべて折りたたみ
" za カーソル位置の折りたたみ切替

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

exmap foldtoggle obcommand editor:toggle-fold
nmap za :foldtoggle<CR>
