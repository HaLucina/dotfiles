return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = { "^.git/" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		-- keymap.set("n", "<leader>ff", function()
		-- 	builtin.find_files({ hidden = true, no_ignore = true, follow = true })
		-- end, { desc = "Find all files (inc. hidden)" })

		keymap.set("n", "<leader>fr", function()
			builtin.oldfiles()
		end, { desc = "Fuzzy find recent files" })

		keymap.set("n", "<leader>fs", function()
			builtin.live_grep({
				additional_args = function()
					return { "--hidden", "--no-ignore", "-L" }
				end,
			})
		end, { desc = "Find string (inc. hidden)" })

		keymap.set("n", "<leader>fc", function()
			builtin.grep_string({
				additional_args = function()
					return { "--hidden", "--no-ignore", "-L" }
				end,
			})
		end, { desc = "Find string under cursor" })

		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
