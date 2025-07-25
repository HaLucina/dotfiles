Failed to setup handlers for which-key.nvim

vim/keymap.lua:0: Invalid (empty) LHS

# stacktrace:
  - vim/keymap.lua:0 _in_ **set**
  - ~/.config/nvim/lua/my/lazy.lua:14
  - nvim/init.lua:2
Press ENTER or type command to continue                                                                                                                                    [mason-lspconfig.nvim] Server "typescript" is not a valid entry in ensure_installed. Make sure to only provide lspconfig server names.
Press ENTER or type command to continue                                                                                                                                    Failed to run `config` for mason.nvim

...g.nvim/lua/mason-lspconfig/features/automatic_enable.lua:47: attempt to call field 'enable' (a nil value)

# stacktrace:
  - /mason-lspconfig.nvim/lua/mason-lspconfig/features/automatic_enable.lua:47 _in_ **fn**
  - /mason.nvim/lua/mason-core/functional/list.lua:116 _in_ **each**
  - /mason-lspconfig.nvim/lua/mason-lspconfig/features/automatic_enable.lua:56 _in_ **init**
  - /mason-lspconfig.nvim/lua/mason-lspconfig/init.lua:43 _in_ **setup**
  - ~/.config/nvim/lua/my/plugins/lsp/mason.lua:27 _in_ **config**
  - ~/.config/nvim/lua/my/lazy.lua:14
  - nvim/init.lua:2
Press ENTER or type command to continue      

Failed to run `config` for nvim-lspconfig

...e/halucina/.config/nvim/lua/my/plugins/lsp/lspconfig.lua:81: attempt to call field 'setup_handlers' (a nil value)

# stacktrace:
  - ~/.config/nvim/lua/my/plugins/lsp/lspconfig.lua:81 _in_ **config**
  - vim/_editor.lua:0
  - /telescope.nvim/lua/telescope/actions/set.lua:162 _in_ **run_replace_or_original**
  - /telescope.nvim/lua/telescope/actions/mt.lua:65 _in_ **run_replace_or_original**
  - /telescope.nvim/lua/telescope/actions/mt.lua:65 _in_ **run_replace_or_original**
  - /telescope.nvim/lua/telescope/actions/mt.lua:65 _in_ **key_func**
  - /telescope.nvim/lua/telescope/mappings.lua:253
