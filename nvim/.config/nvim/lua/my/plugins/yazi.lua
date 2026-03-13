return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- nvim-treeの代わりに <leader>e でYaziを起動する設定
    {
      "<leader>e",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
  },
  opts = {
    -- フローティングウィンドウの設定など
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
}

