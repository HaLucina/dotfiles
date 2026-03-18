return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>ff",
			function()
				require("yazi").yazi()
			end,
			-- require("yazi").yazi() を使うことで、NeovimのCWD（作業ディレクトリ）ではなく、
			-- 現在開いているファイルが存在するディレクトリを起点に Yazi を起動させる。
			-- 以下の書き方だと常にNeovimを起動した場所（プロジェクトルート等）が起点になる
			-- "<cmd>Yazi<cr>",
			mode = { "n", "v" },
			desc = "Open yazi at the current file",
		},
	},
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
