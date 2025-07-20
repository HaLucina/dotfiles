-- For more details > $HOME/dotfiles/README.md:104

vim.g.mapleader = " " -- <leader> set space key

local f = require('my.core.functions') -- functions.lua
local kmap = vim.keymap.set
local opts_table = {
  tt = { noremap = true,   silent = true },
  tf = { noremap = true,   silent = false },
  ft = { noremap = false,  silent = true },
  ff = { noremap = false,  silent = false },
}

local function opts(flag, desc)
  return vim.tbl_extend("force", opts_table[flag], { desc = desc })
end

-- These are not used when keymaps are configured at the OS level.
-- kmap( { 'n', 'i', 'c' }, ';', ':', opts(tf, "Remap ; to :")
-- kmap( { 'n', 'i', 'c' }, ':', ';', opts(tf, "Remap : to ;")

----- |------------- |-------- |------------------------------------ |-----------
--    |Mode          |Keys     |Command                              |Description
----- |------------- |-------- |------------------------------------ |-----------
kmap(  { 'n'      },  '<ESC>',  '<cmd>nohlsearch | redraw | :<CR>',   opts("tt", "Clear search highlights and command line"))
kmap(  { 'i'      },  'jj',     '<ESC>',                              opts("tt", "Exit insert mode"))
kmap(  { 'n', 'x' },  'H',      '0',                                  opts("tt", "Move to line start (0"))
kmap(  { 'n', 'x' },  'L',      '$',                                  opts("tt", "Move to line end ($"))
kmap(  { 'n', 'x' },  'J',      '<C-d>',                              opts("tt", "Scroll half page down"))
kmap(  { 'n', 'x' },  'K',      '<C-u>',                              opts("tt", "Scroll half page up"))
kmap(  { 'n'      },  'j',      'gj',                                 opts("tt", "Move down visual line (gj"))
kmap(  { 'n'      },  'k',      'gk',                                 opts("tt", "Move up visual line (gk"))
kmap(  { 'n'      },  'o',      'o<ESC>',                             opts("tt", "Insert blank line below and stay in Normal mode"))
kmap(  { 'n'      },  'O',      'O<ESC>',                             opts("tt", "Insert blank line above and stay in Normal mode"))
kmap(  { 'n', 'x' },  'gf',     '<C-w>vgF',                           opts("tt", "Go to file in vertical split"))
kmap(  { 'n', 'x' },  'c',      '"_c',                                opts("tt", "Change without yanking (to black hole register"))
kmap(  { 'n', 'x' },  'x',      '"_x',                                opts("tt", "Delete without yanking (to black hole register"))
kmap(  { 'n' ,'x' },  's',      '<Nop>',                              opts("tf", "Disable default 's' command"))
kmap(  { 'n' ,'x' },  'S',      '<Nop>',                              opts("tf", "Disable default 'S' command"))
kmap(  { 'n'      },  'so',     '<cmd>source % | echo "done!"<CR>',   opts("tt", "Source current config file and show success"))
kmap(  { 'n'      },  'sv',     '<cmd>vsplit<CR>',                    opts("tt", "Split window vertically"))
kmap(  { 'n'      },  'sh',     '<cmd>split<CR>',                     opts("tt", "Split window horizontally"))
kmap(  { 'n'      },  'se',     '<cmd>equalalways<CR>',               opts("tt", "Make all windows equal size"))
kmap(  { 'n'      },  'sc',     '<cmd>close<CR>',                     opts("tt", "Close current window"))
kmap(  { 'n'      },  'st',     '<cmd>tabnew<CR>',                    opts("tt", "Open new empty tab"))
kmap(  { 'n'      },  'sw',     '<cmd>tabclose<CR>',                  opts("tt", "Close current tab"))
kmap(  { 'n'      },  'sn',     '<cmd>tabn<CR>',                      opts("tt", "Go to next tab"))
kmap(  { 'n'      },  'sp',     '<cmd>tabp<CR>',                      opts("tt", "Go to previous tab"))
kmap(  { 'n'      },  'sN',     '<cmd>tabnew %<CR>',                  opts("tt", "Open current file in new tab"))
kmap(  { 'n', 'x' },  'sf',     f.highlight_text,                     opts("tt", "Highlight text under cursor"))
kmap(  { 'n', 'x' },  'ss',     f.open_cmdline_for_substitute,        opts("tt", "Start substitute command on command line"))
kmap(  { 'n', 'x' },  'p',      f.push_key_is('p', f.paste_force_lf), opts("tt", "Paste preserving line breaks"))
kmap(  { 'n', 'x' },  'P',      f.push_key_is('P', f.paste_force_lf), opts("tt", "Paste preserving line breaks (before cursor"))
kmap(  { 'n'      },  '<A-j>',  '"zdd"zp',                            opts("tt", "Move current line down"))
kmap(  { 'n'      },  '<A-k>',  '"zdd<Up>"zP',                        opts("tt", "Move current line up"))
kmap(  { 'x'      },  '<A-j>',  '"zx"zp`[V`]',                        opts("tt", "Move selected lines down"))
kmap(  { 'x'      },  '<A-k>',  '"zx<Up>"zP`[V`]',                    opts("tt", "Move selected lines up"))
kmap(  { 'n'      },  '<A-u>',  '<C-u>zz',                            opts("tt", "Scroll half page up and center view"))
kmap(  { 'c'      },  '<C-p>',  '<Up>',                               opts("tt", "Cmdline: navigate history up"))
kmap(  { 'c'      },  '<C-n>',  '<Down>',                             opts("tt", "Cmdline: navigate history down"))
kmap(  { 'c'      },  '<C-b>',  '<Left>',                             opts("tt", "Cmdline: move cursor left"))
kmap(  { 'c'      },  '<C-f>',  '<Right>',                            opts("tt", "Cmdline: move cursor right"))
kmap(  { 'c'      },  '<C-a>',  '<Home>',                             opts("tt", "Cmdline: move cursor to start"))
kmap(  { 'c'      },  '<C-e>',  '<End>',                              opts("tt", "Cmdline: move cursor to end"))
kmap(  { 'c', 'i' },  '<C-d>',  '<Del>',                              opts("tt", "Delete character forward"))
kmap(  { 'c', 'i' },  '<C-h>',  '<BS>',                               opts("tt", "Delete character backward"))
