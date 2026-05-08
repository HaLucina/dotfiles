-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_nvim.md #highlights-lua)

local Zenkaku = "IdeographicSpace"
local highlights = {
	Normal      = { bg = "none" },
	NormalNC    = { fg = "#666666", bg = "none" }, 
	NonText     = { bg = "none" },
	[Zenkaku]   = { bg = "#00FFAA" },
	ColorColumn = { bg = "#454545" },
}

-- 2. 全ハイライトグループを自動収集して winhighlight 用文字列を作る
-- (一度生成すれば ColorScheme が変わるまで使い回せる)
local function generate_winhl_str()
	return table.concat(
		vim.iter(vim.api.nvim_get_hl(0, {}))
			:map(function(name, _) 
				-- Normal自体や特殊なグループを除外して、すべて NormalNC にリンク
				if name ~= "Normal" and name ~= "NormalNC" and not name:match("^WinBar") then
					return name .. ":NormalNC"
				end
			end)
			:totable(),
		","
	)
end

-- 初期生成
local winhl_str = generate_winhl_str()


local function render_appearance()
	vim.iter(highlights)
    :each(function(name, val) vim.api.nvim_set_hl(0, name, val) end)

	vim.iter(vim.fn.getmatches())
    :filter(function(getm)	return getm.group == Zenkaku end)
		:each(function(getm)	vim.fn.matchdelete(getm.id) end)

	vim.fn.matchadd(Zenkaku, "　")
end

-- 4. 自動実行
vim.api.nvim_create_autocmd(
	{ "ColorScheme", "WinEnter", "WinLeave", "BufWinEnter", "VimEnter" },
	{
		desc = "Dynamic Universal Gray-out",
		callback = function(args)
			render_appearance()	
			if args.event == "ColorScheme" then winhl_str = generate_winhl_str() end
			vim.wo.winhighlight = (args.event == "WinLeave") and winhl_str or ""
		end
	}
)

render_appearance()
