-- Documents
-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
      "json","javascript","typescript","tsx","yaml",
      "html","css","prisma","markdown","markdown_inline",
      "svelte","graphql","bash","lua","vim","dockerfile",
      "gitignore","query","vimdoc","c",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
