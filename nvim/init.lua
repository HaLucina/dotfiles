-- 
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.wo.number = true
vim.opt.swapfile = false
vim.opt.termguicolors = true

-- Error detected while processing CursorMoved Autocommands for "<buffer=1>"..function <SNR>22_preview_color[41]..<SNR>22_get_hi_str:
-- line    3:
-- E121: Undefined variable: s:termguicolors
-- 
-- nvimで~/.dircolors を編集してカーソルを下に移動していくと上記のエラーがいちいち出てきた。
-- 解決策は以下をnvim.luaに追記すること。
-- 参考 ＞ https://github.com/neovim/neovim/issues/32097
-- vim.opt.termguicolors = true

-- Use the system clipboard for yank, delete, change and put operationG
vim.opt.clipboard = "unnamedplus"

-- Use xclip as the clipboard provider
if vim.fn.executable('xclip') then
  vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ['+'] = 'xclip -selection clipboard',
      ['*'] = 'xclip -selection primary',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -o',
      ['*'] = 'xclip -selection primary -o',
    },
    cache_enabled = 0,
  }
end
-- 透明な背景を設定
vim.cmd [[
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
]]

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- ここに追加したいプラグインを書く。
  -- GitHubに公開されているプラグインなら、"ユーザー名/リポジトリ名"のフォーマットで記載する。
})
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
}
