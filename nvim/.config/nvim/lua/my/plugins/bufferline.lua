-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
}
