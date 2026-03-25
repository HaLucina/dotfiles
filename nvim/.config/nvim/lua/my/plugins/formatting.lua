-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css             = { "prettier" },
				graphql         = { "prettier" },
				html            = { "prettier" },
				javascript      = { "prettier" },
				javascriptreact = { "prettier" },
				json            = { "prettier" },
				liquid          = { "prettier" },
				lua             = { "stylua"   },
				markdown        = { "prettier" },
				python          = { "isort", "black" },
				svelte          = { "prettier" },
				typescript      = { "prettier" },
				typescriptreact = { "prettier" },
				yaml            = { "prettier" },
			},
		})

		-- フォーマット実行用のキーマップ
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
			vim.notify("Format applied!", vim.log.levels.INFO, { title = "Conform" })
		end, { desc = "Format file or range" })
	end,
}
