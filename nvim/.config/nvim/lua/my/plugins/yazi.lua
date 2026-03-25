-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)

-- https://github.com/mikavilpas/yazi.nvim

return {
  "mikavilpas/yazi.nvim",
    opts = {
      open_for_directories = true,
      keymaps = { show_help = "<f1>", },
	},
	keys = {
		{ "<leader>ff",　"<cmd>Yazi<cr>",　desc = "Open yazi at current file", },
	},
}
