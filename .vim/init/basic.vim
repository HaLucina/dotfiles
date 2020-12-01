"set number, wrapscan とかExコマンド系
"一覧：https://vim-jp.org/vimdoc-ja/vimindex.html#ex-cmd-index
"highlightの設定
" Reference
" https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
" MyVImCommand
" source ~/mygits/dotfiles/.vim/mycommand.vim
"runtime! $HOME/.vim/init/*.vim
"runtime! $HOME/.vim/plugins/*.vim

" 1LienSetting
filetype plugin indent on
syntax on

"set 
set autoindent
set background=dark
set clipboard=unnamedplus
set cursorline
set hlsearch
set incsearch
set laststatus=2 "ステータス行を常に表示
set nofoldenable
set noswapfile
set number
set ruler
set shiftwidth=4
set showcmd "ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set smartindent
set statusline=%F%m%h%w\ %<[ENC=%{&fenc!=''?&fenc:&enc}]\ [FMT=%{&ff}]\ [TYPE=%Y]\ %=[CODE=0x%02B]\ [POS=%l/%L(%02v)]
set tabstop=4
set title
set wildmenu wildmode=list:full
set encoding=utf-8
set fileencodings=utf-8
set ambiwidth=double "全角文字が重ならないようにする設定[https://www.softel.co.jp/blogs/tech/archives/5890]

"let
let loaded_matchparen = 1 "反対側の括弧をハイライトしない
let g:mapleader = "\<Space>"
let &t_EI .= "\e[1 q"
let &t_SI .= "\e[3 q"
let g:netrw_altv = 1
let g:netrw_banner=0
let g:netrw_browse_split = 3
let g:netrw_keepdir=0
let g:netrw_liststyle=1
let g:netrw_preview=1
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_winsize = 180
let g:yankring_n_keys = 'Y D'
let twitvim_browser_cmd = 'firefox' 
let twitvim_count = 40
let twitvim_enable_python = 1 
let twitvim_force_ssl = 1 



au BufRead,BufNewFile *.md set filetype=markdown " MarkDown設定

augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype md inoremap <buffer> </ </<C-x><C-o>
augroup END

" 全角スペースのハイライト設定
" [https://oki2a24.com/2019/02/22/attention-when-visualizing-double-byte-space-with-vim-and-error-when-failing/]
scriptencoding utf-8
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/ 
augroup END


" auto fcitx(挿入モードからコマンドモードになった時、自動的に半角英数にする)
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction
 
set ttimeoutlen=150
" Leave Insert mode
autocmd InsertLeave * call Fcitx2en()

" open-browser 設定
" [https://easyramble.com/open-url-with-browser-from-vim.html]
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-quickrunがpandocに文章を渡すための設定
" [https://kawahara-zakki.com/vim-markdown/]
let g:quickrun_config = {}
let g:quickrun_config = {
      \ "markdown" :{
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-f markdown+hard_line_breaks'
      \}
\}

" 補完ウィンドウの設定
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
