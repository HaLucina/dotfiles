let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden = 1

 function! s:init_fern() abort
   " Use 'select' instead of 'edit' for default 'open' action
 	nmap <buffer> <CR> 	<Plug>(fern-action-open-or-expand)
 	nmap <buffer> - 	<Plug>(fern-action-leave)
	nmap <buffer> D 	<Plug>(fern-action-remove)
	nmap <buffer> M 	<Plug>(fern-action-move)
	nmap <buffer> d		<Plug>(fern-action-new-dir)
	nmap <buffer> m 	<Nop>
	nmap <buffer> e 	<Nop>
	nmap <buffer> l 	<Nop>
 endfunction
 
 augroup fern-custom
 	autocmd! *
 	autocmd FileType fern call s:init_fern()
 augroup END

nmap <silent> m :wincmd h<CR>
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :<C-u>Fern . -reveal=% -drawer -toggle -width=40<CR>

