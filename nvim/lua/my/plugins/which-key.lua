---
return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- または "LazyFile" など、適切なイベントを選択
  init = function()
    -- プラグインがロードされる前に実行される設定
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    },
  }

