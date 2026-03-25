-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)
local Zenkaku = "IdeographicSpace"
local highlights = {
	Normal      = { bg = "none" },
	NonText     = { bg = "none" },
	[Zenkaku]   = { bg = "#00FFAA" },
	ColorColumn = { bg = "#454545" },
}


local function render_appearance()
	vim.iter(highlights)
    :each(function(name, val) vim.api.nvim_set_hl(0, name, val) end)

	vim.iter(vim.fn.getmatches())
    :filter(function(getm)	return getm.group == Zenkaku end)
		:each(function(getm)	vim.fn.matchdelete(getm.id) end)

	vim.fn.matchadd(Zenkaku, "　")
end

vim.opt.colorcolumn = { 80, 100, 120 }

-- 3. 自動実行の集約
-- ColorScheme: カラースキーム変更時
-- WinEnter/BufWinEnter: 画面分割やバッファ移動時
-- VimEnter: 起動時
vim.api.nvim_create_autocmd(
  { "ColorScheme", "WinEnter", "BufWinEnter", "VimEnter" },
  { callback = render_appearance}
)

render_appearance()
