Failed to run `config` for mason.nvim

...g.nvim/lua/mason-lspconfig/features/automatic_enable.lua:47: attempt to call field 'enable' (a nil value)

# stacktrace:
  - /mason-lspconfig.nvim/lua/mason-lspconfig/features/automatic_enable.lua:47 _in_ **fn**
  - /mason.nvim/lua/mason-core/functional/list.lua:116 _in_ **each**
  - /mason-lspconfig.nvim/lua/mason-lspconfig/features/automatic_enable.lua:56 _in_ **init**
  - /mason-lspconfig.nvim/lua/mason-lspconfig/init.lua:43 _in_ **setup**
  - ~/.config/nvim/lua/my/plugins/lsp/mason.lua:24 _in_ **config**
  - ~/.config/nvim/lua/my/lazy.lua:14
  - init.lua:2 - /telescope.nvim/lua/telescope/mappings.lua:253
