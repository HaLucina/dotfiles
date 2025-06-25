vim.cmd("let g:netrw_liststyle = 3")

-- 透明な背景を設定
-- vim.cmd [[
--   highlight Normal ctermbg=none guibg=none
--   highlight NonText ctermbg=none guibg=none
-- ]]

vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none", bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "none", bg = "none" })

local opt = vim.opt -- for conciseness

-- 全角スペースを常時ハイライト
vim.api.nvim_set_hl(0, "IdeographicSpace", { bg = "#006400" })
vim.fn.matchadd("IdeographicSpace", "　")
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "IdeographicSpace", { bg = "#006400" })
  end,
})

local uname = vim.uv.os_uname()
local group = vim.api.nvim_create_augroup("kyoh86-conf-ime", {})
if uname.sysname == "Linux" then
  if os.getenv("WSL_DISTRO_NAME") ~= "" then
    vim.api.nvim_create_autocmd("InsertLeave", {
      group = group,
      command = "silent! !zenhan.exe 0",
    })
  else
    -- 割愛: WSL以外の設定
    vim.api.nvim_create_autocmd("InsertLeave", { 
      callback = function()
    vim.fn.jobstart({ "fcitx-remote", "-c" })
      end,
    })
  end
else
  -- 割愛: Linux以外の設定
end

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
-- vim.opt.termguicolors = true


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
opt.colorcolumn = {80, 100, 120}
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#454545" })

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
