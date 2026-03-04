"let s:base_dir = expand('~/mygist/dotfiles/.vim')

" runtimepathに追加
"execute 'set runtimepath^=' . fnamemodify(s:base_dir, ':p')

"tnoremap <Esc> <C-\><C-n>
"command! -nargs=* T split | wincmd j | resize 20 | terminal <args>

runtime! .vim/init/*.vim
runtime! .vim/plugins/*.vim
