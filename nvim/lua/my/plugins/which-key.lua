return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    delay = 0,
    spec = {
      {
        mode = "i", -- insert mode mappings
        { "<C-x><C-l>", desc = "Whole lines" },
        { "<C-x><C-n>", desc = "Keywords in current file" },
        { "<C-x><C-k>", desc = "Keywords in dictionary" },
        { "<C-x><C-t>", desc = "Keywords in thesaurus" },
        { "<C-x><C-i>", desc = "Keywords in current+included files" },
        { "<C-x><C-]>", desc = "Tags" },
        { "<C-x><C-f>", desc = "File names" },
        { "<C-x><C-d>", desc = "Definitions/macros" },
        { "<C-x><C-v>", desc = "Vim command-line" },
        { "<C-x><C-u>", desc = "User-defined completion" },
        { "<C-x><C-o>", desc = "Omni completion" },
        { "<C-x><C-s>", desc = "Spelling suggestions" },
        { "<C-x><C-z>", desc = "Stop completion" },
      },
      {
        -- <C-Space> is Just view a list, like help. 
        mode = "i", -- insert mode mappings
        { "<C-s><Space>", desc = "show completion suggestions"}, 
        { "<C-s><C-k>", desc = "previous suggestion"},
        { "<C-s><C-j>", desc = "next suggestion"},
        { "<C-s><C-b>", desc = "scroll docs(-4)"},
        { "<C-s><C-f>", desc = "scroll docs(+4)"},
        { "<C-s><C-e>", desc = "close completion window"}, 
        { "<C-s><CR>", desc = "confirm"},
      },
    },
    triggers = {
      { "<leader>", mode = "nixsotc" },
      { "<leader>e", mode = "nixsotc"},
      { "<C-x>", mode = "i" },
      { "<C-s>", mode = "i" },
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
    {
      "<leader>e",
      function()
        require("nvim-tree")
      end,
      desc = "File explorer(nvim-tree)",
    },
    {
      "<leader>h",
      function()
        require("gitsigns")
      end,
      desc = "gitsigns(gitsigns)",
    },
    -- {
  --     "<leader>l",
  --     function()
  --       require("gitsigns")
  --     end,
  --     desc = "LSP Commands(lspconfig)",
  -- },
  -- {
  --     "<leader>L",
  --     function()
  --       require("lazygit")
  --     end,
  --     desc = "Lazy Commands(lazygit)"
  -- },
  -- {
  --     "<leader>???", lintingのコマンド登録どうしようか悩む
  --     function()
  --       require("linting")
  --     end,
  --     desc = "Linting Commands(linting)"
  --   },
    {
      "<leader>f",
      function()
        require("telescope")
      end,
      desc = "FuzzyFind(nvim-tree)",
    },
    {
      "<leader>w",
      function()
        require("auto-session")
      end,
      desc = "Control Session(nvim-tree)",
    },
    {
      "<leader>x",
      function()
        require("trouble")
      end,
      desc = "Trouble diagnostics(trouble)",
    },
  }
}
