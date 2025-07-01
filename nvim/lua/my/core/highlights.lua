vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none", bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "none", bg = "none" })

-- 全角スペースを常時ハイライト
vim.api.nvim_set_hl(0, "IdeographicSpace", { bg = "#006400" })
vim.fn.matchadd("IdeographicSpace", "　")
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "IdeographicSpace", { bg = "#006400" })
  end,
})

-- turn on colorcolumn at 80, 100, 120
vim.opt.colorcolumn = {80, 100, 120}
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#454545" })
