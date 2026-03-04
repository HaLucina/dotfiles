" Reference
" https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
" MyVImCommand
" source ~/mygits/dotfiles/.vim/mycommand.vim

"https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
"変なシーケンスを出さないようにする方法
"vimrcに書かないと機能しない
set t_TI= t_TE=

call plug#begin()

[[plugins]]
repo = 'tpope/vim-fugitive'

[[plugins]]
repo = 'gregsexton/gitv'

[[plugins]]
repo = 'vim-scripts/sudo.vim'

[[plugins]]
repo = 'tyru/open-browser.vim'

[[plugins]]
repo = 'kannokanno/previm'

[[plugins]]
repo = 'thinca/vim-quickrun'

[[plugins]]
repo = 'tpope/vim-markdown'

[[plugins]]
repo = 'dhruvasagar/vim-table-mode'

[[plugins]]
repo = 'basyura/TweetVim'

[[plugins]]
repo = 'mattn/webapi-vim'

[[plugins]]
repo = 'basyura/twibill.vim'

[[plugins]]
repo = 'h1mesuke/unite-outline'

[[plugins]]
repo = 'basyura/bitly.vim'

[[plugins]]
repo = 'Shougo/unite.vim'

#[[plugins]]
#repo = 'lambdalisue/fern.vim' 
#
#[[plugins]]
#repo = 'vim-airline/vim-airline'
#
#[[plugins]]
#repo = 'vim-airline/vim-airline-themes'
#
#[[plugins]]
#repo = 'lambdalisue/nerdfont.vim'
#
#[[plugins]]
#repo = 'lambdalisue/fern-renderer-nerdfont.vim'
#
#[[plugins]]
#repo = 'lambdalisue/glyph-palette.vim'
call plug#end()

let $XDG_VIM_HOME = $HOME.'/.config/vim'
set runtimepath+=$XDG_VIM_HOME
runtime! init/*.vim
runtime! plugins/*.vim 

"runtime! .vim/init/*.vim
"runtime! .vim/plugins/*.vim
