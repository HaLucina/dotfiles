return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    local ss = require('smart-splits')
    ss.setup({
      -- WezTermの端に到達した時に、WezTermのペイン移動を発動させる設定
      at_edge = 'wrap', 
    })

    -- キーバインド設定 (Ctrl + hjkl)
    -- Neovim内ではウィンドウ移動、端ではWezTermへ移動
    vim.keymap.set('n', '<C-h>', ss.move_cursor_left)
    vim.keymap.set('n', '<C-j>', ss.move_cursor_down)
    vim.keymap.set('n', '<C-k>', ss.move_cursor_up)
    vim.keymap.set('n', '<C-l>', ss.move_cursor_right)
  end,
}
