" set number, wrapscan など ネイティブvimのExコマンド系
" 1行で済んでいる設定をまとめたもの
" Exコマンド一覧：https://vim-jp.org/vimdoc-ja/vimindex.html"ex-cmd-index

"""""" various Area """"""
filetype plugin indent on
au BufRead,BufNewFile *.md set filetype=markdown " MarkDown設定
"""""" various End """"""


"""""" set Area """"""
set autoindent
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
"""""" set End """"""



"""""" let Area """""" 
let loaded_matchparen = 1 "反対側の括弧をハイライトしない
let &t_EI .= "\e[1 q" "カーソル形状を箱型で点滅状態にする
let &t_SI .= "\e[3 q" "カーソル形状を下線で点滅状態にする
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
"""""" let End """"""
