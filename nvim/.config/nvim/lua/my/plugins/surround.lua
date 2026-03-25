-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true
}
