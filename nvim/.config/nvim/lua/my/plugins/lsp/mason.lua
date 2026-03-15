return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- LSP以外のツール管理用に追加
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-tool-installer
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- LSPサーバーの設定
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright", -- Python用LSP
      },
    })

    -- LSP以外のツール（Linter/Formatter）の自動インストール設定
    mason_tool_installer.setup({
      ensure_installed = {
        "pylint",   -- Pythonエラーチェック（エラーの原因となっていたツール）
        "black",    -- Pythonコード整形
        "isort",    -- Pythonインポート順序整理
        "prettier", -- HTML/CSS/JS用整形
        "stylua",   -- Lua用整形
      },
    })
  end,
}
