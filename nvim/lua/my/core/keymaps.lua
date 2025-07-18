-- For more details > $HOME/dotfiles/README.md:104

vim.g.mapleader = " " -- <space>

local f = require('my.core.functions') -- functions.lua
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

----- |------------- |-------- |------------------------------------ |-----------
--    |Mode          |Keys     |Command                              |Description
----- |------------- |-------- |------------------------------------ |-----------
kmap(  { 'n'      },  '<ESC>',  '<cmd>nohlsearch | redraw | :<CR>',   opts.TT, { desc = "Clear search highlights and command line" })
kmap(  { 'i'      },  'jj',     '<ESC>',                              opts.TT, { desc = "Exit insert mode" })
kmap(  { 'n', 'x' },  'H',      '0',                                  opts.TT, { desc = "Move to line start (0)" })
kmap(  { 'n', 'x' },  'L',      '$',                                  opts.TT, { desc = "Move to line end ($)" })
kmap(  { 'n', 'x' },  'J',      '<C-d>',                              opts.TT, { desc = "Scroll half page down" })
kmap(  { 'n', 'x' },  'K',      '<C-u>',                              opts.TT, { desc = "Scroll half page up" })
kmap(  { 'n'      },  'j',      'gj',                                 opts.TT, { desc = "Move down visual line (gj)" })
kmap(  { 'n'      },  'k',      'gk',                                 opts.TT, { desc = "Move up visual line (gk)" })
kmap(  { 'n'      },  'o',      'o<ESC>',                             opts.TT, { desc = "Insert blank line below and stay in Normal mode" })
kmap(  { 'n'      },  'O',      'O<ESC>',                             opts.TT, { desc = "Insert blank line above and stay in Normal mode" })
kmap(  { 'n', 'x' },  'gf',     '<C-w>vgF',                           opts.TT, { desc = "Go to file in vertical split" })
kmap(  { 'n', 'x' },  'c',      '"_c',                                opts.TT, { desc = "Change without yanking (to black hole register)" })
kmap(  { 'n', 'x' },  'x',      '"_x',                                opts.TT, { desc = "Delete without yanking (to black hole register)" })
kmap(  { 'n' ,'x' },  's',      '<Nop>',                              opts.TF, { desc = "Disable default 's' command" })
kmap(  { 'n' ,'x' },  'S',      '<Nop>',                              opts.TF, { desc = "Disable default 'S' command" })
kmap(  { 'n'      },  'so',     '<cmd>source % | echo "done!"<CR>',   opts.TF, { desc = "Source current config file and show success" })
kmap(  { 'n'      },  'sv',     '<cmd>vsplit<CR>',                    opts.TT, { desc = "Split window vertically" })
kmap(  { 'n'      },  'sh',     '<cmd>split<CR>',                     opts.TT, { desc = "Split window horizontally" })
kmap(  { 'n'      },  'se',     '<cmd>equalalways<CR>',               opts.TT, { desc = "Make all windows equal size" })
kmap(  { 'n'      },  'sc',     '<cmd>close<CR>',                     opts.TT, { desc = "Close current window" })
kmap(  { 'n'      },  'st',     '<cmd>tabnew<CR>',                    opts.TT, { desc = "Open new empty tab" })
kmap(  { 'n'      },  'sw',     '<cmd>tabclose<CR>',                  opts.TT, { desc = "Close current tab" })
kmap(  { 'n'      },  'sn',     '<cmd>tabn<CR>',                      opts.TT, { desc = "Go to next tab" })
kmap(  { 'n'      },  'sp',     '<cmd>tabp<CR>',                      opts.TT, { desc = "Go to previous tab" })
kmap(  { 'n'      },  'sN',     '<cmd>tabnew %<CR>',                  opts.TT, { desc = "Open current file in new tab" })
kmap(  { 'n', 'x' },  'sf',     f.highlight_text,                     opts.TT, { desc = "Highlight text under cursor" })
kmap(  { 'n', 'x' },  'ss',     f.open_cmdline_for_substitute,        opts.TT, { desc = "Start substitute command on command line" })
kmap(  { 'n', 'x' },  'p',      f.push_key_is('p', f.paste_force_lf), opts.TT, { desc = "Paste preserving line breaks" })
kmap(  { 'n', 'x' },  'P',      f.push_key_is('P', f.paste_force_lf), opts.TT, { desc = "Paste preserving line breaks (before cursor)" })
kmap(  { 'n'      },  '<A-j>',  '"zdd"zp',                            opts.TT, { desc = "Move current line down" })
kmap(  { 'n'      },  '<A-k>',  '"zdd<Up>"zP',                        opts.TT, { desc = "Move current line up" })
kmap(  { 'x'      },  '<A-j>',  '"zx"zp`[V`]',                        opts.TT, { desc = "Move selected lines down" })
kmap(  { 'x'      },  '<A-k>',  '"zx<Up>"zP`[V`]',                    opts.TT, { desc = "Move selected lines up" })
kmap(  { 'n'      },  '<A-u>',  '<C-u>zz',                            opts.TT, { desc = "Scroll half page up and center view" })
kmap(  { 'c'      },  '<C-p>',  '<Up>',                               opts.TT, { desc = "Cmdline: navigate history up" })
kmap(  { 'c'      },  '<C-n>',  '<Down>',                             opts.TT, { desc = "Cmdline: navigate history down" })
kmap(  { 'c'      },  '<C-b>',  '<Left>',                             opts.TT, { desc = "Cmdline: move cursor left" })
kmap(  { 'c'      },  '<C-f>',  '<Right>',                            opts.TT, { desc = "Cmdline: move cursor right" })
kmap(  { 'c'      },  '<C-a>',  '<Home>',                             opts.TT, { desc = "Cmdline: move cursor to start" })
kmap(  { 'c'      },  '<C-e>',  '<End>',                              opts.TT, { desc = "Cmdline: move cursor to end" })
kmap(  { 'c', 'i' },  '<C-d>',  '<Del>',                              opts.TT, { desc = "Delete character forward" })
kmap(  { 'c', 'i' },  '<C-h>',  '<BS>',                               opts.TT, { desc = "Delete character backward" })
