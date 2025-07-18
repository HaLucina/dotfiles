return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
  --   delay = 0,
  --   spec = {
  --     -- { "s", group = "[S]earch" },
  --     { "<leader>", group = "test" },
  --     {
  --       mode = "i", -- insert mode mappings
  --       { "<C-x><C-l>", desc = "Whole lines" },
  --       { "<C-x><C-n>", desc = "Keywords in current file" },
  --       { "<C-x><C-k>", desc = "Keywords in dictionary" },
  --       { "<C-x><C-t>", desc = "Keywords in thesaurus" },
  --       { "<C-x><C-i>", desc = "Keywords in current+included files" },
  --       { "<C-x><C-]>", desc = "Tags" },
  --       { "<C-x><C-f>", desc = "File names" },
  --       { "<C-x><C-d>", desc = "Definitions/macros" },
  --       { "<C-x><C-v>", desc = "Vim command-line" },
  --       { "<C-x><C-u>", desc = "User-defined completion" },
  --       { "<C-x><C-o>", desc = "Omni completion" },
  --       { "<C-x><C-s>", desc = "Spelling suggestions" },
  --       { "<C-x><C-z>", desc = "Stop completion" },
  --     },
  --   },
    triggers = {
      { "<leader>", mode = "nixsotc" },
      { "s", mode = "nixsotc" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
