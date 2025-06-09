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


"map leader for local search"
"fuzzy serach with omnisearch Omnisearch pluginが必要
"これを入れるとcore plugiのFile ExplorerとSearchがいらなくなる
"Leader key search/replace (<leader>s)
"スペース+/ でノート内検索
"スペース+f でファジー検索
"スペース+s で検索置換ウィンドウ

exmap local_search obcommand editor:open-search
nmap <Space>/ :local_search<CR>
vmap <Space>/ :local_search<CR>

exmap omnisearch_search obcommand omnisearch:show-modal
nmap <Space>f :omnisearch_search<CR>

exmap search_replace obcommand editor:open-search-replace
nmap <Space>s :search_replace<CR>


" Folding (matching your zR and zM)
"すべての折りたたみを開く。zRで実行。
"すべての折りたたみを閉じる。zMで実行。
"現在カーソル位置の折りたたみ/展開を切替。zaで実行。

exmap unfoldall obcommand editor:unfold-all
nmap <Space>R :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap <Space>M :foldall<CR>

exmap toggle_fold obcommand editor:toggle-fold
nmap <Space>a :toggle_fold<CR>