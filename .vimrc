" Reference
" https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
" MyVImCommand
" source ~/mygits/dotfiles/.vim/mycommand.vim

"https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
"変なシーケンスを出さないようにする方法
"vimrcに書かないと機能しない
set t_TI= t_TE=

let $XDG_VIM_HOME = $HOME.'/.config/vim'
set runtimepath+=$XDG_VIM_HOME

call plug#begin($XDG_VIM_HOME.'/plugged')
	Plug 'tpope/vim-fugitive'
	Plug 'gregsexton/gitv'
	Plug 'vim-scripts/sudo.vim'
	Plug 'tyru/open-browser.vim'
	Plug 'kannokanno/previm'
	Plug 'thinca/vim-quickrun'
	Plug 'tpope/vim-markdown'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'basyura/TweetVim'
	Plug 'mattn/webapi-vim'
	Plug 'basyura/twibill.vim'
	Plug 'h1mesuke/unite-outline'
	Plug 'basyura/bitly.vim'
	Plug 'Shougo/unite.vim'
	Plug 'lambdalisue/fern.vim' 
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'lambdalisue/nerdfont.vim'
	Plug 'lambdalisue/fern-renderer-nerdfont.vim'
	Plug 'lambdalisue/glyph-palette.vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'lambdalisue/fern-git-status.vim'
call plug#end()

runtime! init/*.vim
runtime! plugins/*.vim 

"runtime! .vim/init/*.vim
"runtime! .vim/plugins/*.vim
