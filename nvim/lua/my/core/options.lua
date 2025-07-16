
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Error detected while processing CursorMoved Autocommands for 
-- "<buffer=1>"..function <SNR>22_preview_color[41]..<SNR>22_get_hi_str:
-- line    3:
-- E121: Undefined variable: s:termguicolors
-- 
-- nvimで~/.dircolors を編集してカーソルを下に移動していくと上記のエラーが
-- いちいち出てきた。
-- 解決策は以下をnvim.luaに追記すること。
-- 参考 ＞ https://github.com/neovim/neovim/issues/32097

-- set opacity with colorscheme(tokyonight-night)
vim.opt.termguicolors = true
vim.opt.winblend = 0 -- window opacity
vim.opt.pumblend = 0 -- popup menu opacity

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- enable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
