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

imap jj <Esc>


" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
unmap <Space>
exmap forward obcommand app:go-forward
nmap <Space>q :forward<CR>