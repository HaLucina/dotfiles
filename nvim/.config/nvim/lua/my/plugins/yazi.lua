-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)
return {
  priority = 1000, -- 他のプラグインより先に読み込みを開始
	"mikavilpas/yazi.nvim",
	-- 1. VeryLazyにすることで、起動直後の負荷が落ち着いた瞬間に確実にロードする
	event = "VeryLazy",
	-- 2. lazy = false よりも、起動時に確実に setup を走らせる方が安定する
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				-- 3. require("yazi").yazi() に空のテーブル {} を渡すのが現在の推奨。
				-- これにより、opts の設定を維持しつつ、現在のファイルを起点に開けます。
				require("yazi").yazi({})
			end,
			mode = { "n", "v" },
			desc = "Open yazi at the current file",
		},
	},
}
