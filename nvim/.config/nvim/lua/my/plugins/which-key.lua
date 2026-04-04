-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function() 
    vim.o.timeout    = true 
    vim.o.timeoutlen = 500 
  end,

	opts = {
		delay   = 0,
		plugins = {
			marks     = false, -- m などのマーク一覧を非表示
			registers = false, -- " などのレジスタ一覧を非表示
			presets   = {
				operators    = false,  -- d, y などのオペレータを非表示
				motions      = false,  -- h, j, k, l などの移動を非表示
				text_objects = false,  -- iw, ap などのテキストオブジェクトを非表示
				windows      = false,  -- <C-w> 系のウィンドウ操作を非表示
				nav          = false,  -- <C-d>, <C-u> などを非表示
				z            = false,  -- z 系の折りたたみ等を非表示
				g            = false,  -- g 系の標準コマンドを非表示
			},
		},

		spec = {
			{ "<leader>f", group = "file/find", icon = "󰈔 " },
			{ "<leader>l", group = "LSP", icon = "󱐋 " },
			{ "<leader>L", group = "LazyGit", icon = "󰊢 " },
			{ "<leader>h", group = "Git Signs", icon = "󰊢 " },
			{ "<leader>x", group = "Trouble/Diagnostics", icon = "󱖫 " },
			{ "<leader>w", group = "Session", icon = "󰒲 " },
		},

		triggers = {
			{ "<leader>", mode = "nixsotc" },
			{ "s",        mode = "nixsotc" },
			{ "g",        mode = "nixsotc" },
		},
	},

	keys = {
		{
			"<leader>?",
			function() require("which-key").show({ global = true }) end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
