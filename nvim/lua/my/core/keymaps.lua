-- ## Why use `f.call`?
--     1. This is for operations where I need to pass `Keys` as an argument.
--     2. To achieve this, I'd normally have to write an anonymous function directly in the keymap command.
--        example: `vim.keymap.set('n', 'j', function() myfunc('j') end)`
--     3. Therefore, I created a wrapper function `call` to shorten and simplify this.
-- 
-- ## Usage of `f.call`
--     `f.call(f.myfunc, Keys)` is used when `f.myfunc` needs arguments (`Keys`).
--     The `f` prefix indicates that `myfunc` is defined within the `functions.lua` module.

vim.g.mapleader = " " 
local f = require('my.core.functions')
local kmap = vim.keymap.set
local opts = {
  TT = { noremap = true,   silent = true },
  TF = { noremap = true,   silent = false },
  FT = { noremap = false,  silent = true },
  FF = { noremap = false,  silent = false },
}

-- These are not used when keymaps are configured at the OS level.
-- kmap( { 'n', 'i', 'c' }, ';', ':', opts.TF, { desc = "Remap ; to :" })
-- kmap( { 'n', 'i', 'c' }, ':', ';', opts.TF, { desc = "Remap : to ;" })

-----|-------------|--------------|-------------------------------|-----------
-----|Mode         |Keys          |Command                        |Description
-----|-------------|--------------|-------------------------------|-----------
kmap( { 'n'      }, '<ESC>',       '<cmd>nohlsearch | redraw<CR>', opts.TT, { desc = "Clear search highlights and redraw (cmd input)" })
kmap( { 'i'      }, 'jj',          '<ESC>',                        opts.TT, { desc = "Exit insert mode with jj" })
kmap( { 'n', 'x' }, 'H',           '0',                            opts.TT, { desc = "Home row: move to line start" })
kmap( { 'n', 'x' }, 'L',           '$',                            opts.TT, { desc = "Home row: move to line end" })
kmap( { 'n', 'x' }, 'J',           '}zz',                          opts.TT, { desc = "Home row: move to next paragraph" })
kmap( { 'n', 'x' }, 'K',           '{zz',                          opts.TT, { desc = "Home row: move to previous paragraph" })
kmap( { 'n', 'x' }, 'c',           '"_c',                          opts.TT, { desc = "Change without yanking" })
kmap( { 'n', 'x' }, 'x',           '"_x',                          opts.TT, { desc = "Delete without yanking" })
kmap( { 'n'      }, 'j',           'gj',                           opts.TT, { desc = "Smarter line navigation down (gj)" })
kmap( { 'n'      }, 'k',           'gk',                           opts.TT, { desc = "Smarter line navigation up (gk)" })
kmap( { 'n'      }, 'o',           'o<ESC>',                       opts.TT, { desc = "Insert blank line below and remain in normal mode" })
kmap( { 'n'      }, 'O',           'O<ESC>',                       opts.TT, { desc = "Insert blank line above and remain in normal mode" })
kmap( { 'n', 'x' }, 'P',           f.call(f.paste_force_lf, 'P'),  opts.TT, { desc = "nothing"})
kmap( { 'n', 'x' }, 'p',           f.call(f.paste_force_lf, 'p'),  opts.TT, { desc = "nothing"})
kmap( { 'n', 'x' }, 's',           f.highlight_text,               opts.TT, { desc = "Highlight word under cursor (cmd input)" })
kmap( { 'n', 'x' }, 'S',           f.open_cmdline_for_substitute,  opts.TT, { desc = "Substitute by last search pattern (cmd input)" })
kmap( { 'n'      }, '<C-j>',       '"zdd"zp',                      opts.TT, { desc = "Move current line down" })
kmap( { 'n'      }, '<C-k>',       '"zdd<Up>"zP',                  opts.TT, { desc = "Move current line up" })
kmap( { 'x'      }, '<C-j>',       '"zx"zp`[V`]',                  opts.TT, { desc = "Move selected lines down" })
kmap( { 'x'      }, '<C-k>',       '"zx<Up>"zP`[V`]',              opts.TT, { desc = "Move selected lines up" })
kmap( { 'n'      }, '<C-d>',       '<C-d>zz',                      opts.TT, { desc = "Half page down and center" })
kmap( { 'n'      }, '<C-u>',       '<C-u>zz',                      opts.TT, { desc = "Half page up and center" })
kmap( { 'n'      }, '<C-l>',       'zl',                           opts.TT, { desc = "Scroll screen right" })
kmap( { 'n'      }, '<C-h>',       'zh',                           opts.TT, { desc = "Scroll screen left" })
kmap( { 'n'      }, '<leader>sv',  '<C-w>v',                       opts.TT, { desc = "Split window vertically" })
kmap( { 'n'      }, '<leader>sh',  '<C-w>s',                       opts.TT, { desc = "Split window horizontally" })
kmap( { 'n'      }, '<leader>se',  '<C-w>=',                       opts.TT, { desc = "Make splits equal size" })
kmap( { 'n'      }, '<leader>sx',  '<cmd>close<CR>',               opts.TT, { desc = "Close current split" })
kmap( { 'n'      }, '<leader>to',  '<cmd>tabnew<CR>',              opts.TT, { desc = "Open new tab" })
kmap( { 'n'      }, '<leader>tx',  '<cmd>tabclose<CR>',            opts.TT, { desc = "Close current tab" })
kmap( { 'n'      }, '<leader>tn',  '<cmd>tabn<CR>',                opts.TT, { desc = "Go to next tab" })
kmap( { 'n'      }, '<leader>tp',  '<cmd>tabp<CR>',                opts.TT, { desc = "Go to previous tab" })
kmap( { 'n'      }, '<leader>tf',  '<cmd>tabnew %<CR>',            opts.TT, { desc = "Open current buffer in new tab" })
kmap( { 'c'      }, '<C-p>',       '<Up>',                         opts.TT, { desc = "Cmdline: move up in history" })
kmap( { 'c'      }, '<C-n>',       '<Down>',                       opts.TT, { desc = "Cmdline: move down in history" })
kmap( { 'c'      }, '<C-b>',       '<Left>',                       opts.TT, { desc = "Cmdline: move left" })
kmap( { 'c'      }, '<C-f>',       '<Right>',                      opts.TT, { desc = "Cmdline: move right" })
kmap( { 'c'      }, '<C-a>',       '<Home>',                       opts.TT, { desc = "Cmdline: move to start" })
kmap( { 'c'      }, '<C-e>',       '<End>',                        opts.TT, { desc = "Cmdline: move to end" })
kmap( { 'c', 'i' }, '<C-d>',       '<Del>',                        opts.TT, { desc = "Cmdline: delete character" })
kmap( { 'c', 'i' }, '<C-h>',       '<BS>',                         opts.TT, { desc = "Insert: <C-h> as <BS>" })

