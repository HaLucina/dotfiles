-- Documents
-- (~/dotfiles/readmes/toc_nvim.md #keymap-lua)
-- (~/dotfiles/readmes/toc_ALLKeyMap.md #why-push-key)

local myf = require("my.core.functions")
local kmap = vim.keymap.set

local opts_tbl = {
	TT = { noremap = true, silent = true },
	TF = { noremap = true, silent = false },
	FT = { noremap = false, silent = true },
	FF = { noremap = false, silent = false },
}

local function opts(select_TF, desc_text)
	return vim.tbl_extend("force", opts_tbl[select_TF], { desc = desc_text })
end

-- <leader> set space key
vim.g.mapleader = " "

-- Not used keymaps
-- kmap({ 'n', 'i', 'c' }, ';', ':', opts(tf, "Remap ; to :")
-- kmap({ 'n', 'i', 'c' }, ':', ';', opts(tf, "Remap : to ;")

----- |--------------- |------------ |----------------------------------------- |--------
--    |Mode            |Keys         |Command                                   |Description
----- |--------------- |------------ |----------------------------------------- |--------
kmap({ "n"           }, "<ESC>",      "<cmd>nohlsearch | redraw | :<CR>",        opts("TT", "Clear search highlights and command line"))
kmap({ "i"           }, "jj",         "<ESC>",                                   opts("TT", "Exit insert mode"))
kmap({ "i"           }, "っｊ",       "<ESC>",                                   opts("TT", "Exit insert mode"))
kmap({ "n"           }, "q:",         "<Nop>",                                   opts("TT", "Typo prevention"))
kmap({ "n", "x"      }, "H",          "0",                                       opts("TT", "Move to line start (0"))
kmap({ "n", "x"      }, "L",          "$",                                       opts("TT", "Move to line end ($"))
kmap({ "n", "x"      }, "J",          "<C-d>",                                   opts("TT", "Scroll half page down"))
kmap({ "n", "x"      }, "K",          "<C-u>",                                   opts("TT", "Scroll half page up"))
kmap({ "n"           }, "j",          "gj",                                      opts("TT", "Move down visual line (gj"))
kmap({ "n"           }, "k",          "gk",                                      opts("TT", "Move up visual line (gk"))
kmap({ "n"           }, "o",          "o<ESC>",                                  opts("TT", "Insert blank line below and stay in Normal mode"))
kmap({ "n"           }, "O",          "O<ESC>",                                  opts("TT", "Insert blank line above and stay in Normal mode"))
kmap({ "n", "x"      }, "gf",          "<C-w>vgF",                               opts("TT", "Go to file in vertical split"))
kmap({ "n", "x"      }, "c",          '"_c',                                     opts("TT", "Change without yanking (to black hole register"))
kmap({ "n", "x"      }, "x",          '"_x',                                     opts("TT", "Delete without yanking (to black hole register"))
kmap({ "n", "x"      }, "s",          "<Nop>",                                   opts("TF", "Disable default 's' command"))
kmap({ "n", "x"      }, "S",          "<Nop>",                                   opts("TF", "Disable default 'S' command"))
kmap({ "n"           }, "so",         '<cmd>source % | echo "done!"<CR>',        opts("TT", "Source current config file and show success"))
kmap({ "n"           }, "s\\",        "<cmd>vsplit<CR>",                         opts("TT", "Split window vertically"))
kmap({ "n"           }, "s-",         "<cmd>split<CR>",                          opts("TT", "Split window horizontally"))
kmap({ "n"           }, "se",         "<cmd>equalalways<CR>",                    opts("TT", "Make all windows equal size"))
kmap({ "n"           }, "st",         "<cmd>tabnew<CR>",                         opts("TT", "Open new empty tab"))
kmap({ "n"           }, "sc",         "<cmd>close<CR>",                          opts("TT", "Close current window"))
kmap({ "n"           }, "sw",         "<cmd>tabclose<CR>",                       opts("TT", "Close current tab"))
kmap({ "n"           }, "<C-Tab>",    "<cmd>tabn<CR>",                           opts("TT", "Go to next tab"))
kmap({ "n"           }, "<C-S-Tab>",  "<cmd>tabp<CR>",                           opts("TT", "Go to previous tab"))
kmap({ "n", "x"      }, "<C-f>",      myf.highlight_text,                        opts("TT", "Highlight text under cursor"))
kmap({ "n", "x"      }, "<C-h>",      myf.open_cmdline_for_substitute,           opts("TT", "Start substitute command on command line"))
kmap({ "n", "x"      }, "p",          myf.push_key_is("p", myf.paste_force_lf),  opts("TT", "Paste preserving line breaks"))
kmap({ "n", "x"      }, "P",          myf.push_key_is("P", myf.paste_force_lf),  opts("TT", "Paste preserving line breaks (before cursor"))
kmap({ "n"           }, "<A-j>",      '"zdd"zp',                                 opts("TT", "Move current line down"))
kmap({ "n"           }, "<A-k>",      '"zdd<Up>"zP',                             opts("TT", "Move current line up"))
kmap({ "x"           }, "<A-j>",      '"zx"zp`[V`]',                             opts("TT", "Move selected lines down"))
kmap({ "x"           }, "<A-k>",      '"zx<Up>"zP`[V`]',                         opts("TT", "Move selected lines up"))
kmap({ "n"           }, "<A-u>",      "<C-u>zz",                                 opts("TT", "Scroll half page up and center view"))
kmap({ "c"           }, "<C-p>",      "<Up>",                                    opts("TT", "Cmdline: navigate history up"))
kmap({ "c"           }, "<C-n>",      "<Down>",                                  opts("TT", "Cmdline: navigate history down"))
kmap({ "c"           }, "<C-b>",      "<Left>",                                  opts("TT", "Cmdline: move cursor left"))
kmap({ "c"           }, "<C-f>",      "<Right>",                                 opts("TT", "Cmdline: move cursor right"))
kmap({ "c"           }, "<C-a>",      "<Home>",                                  opts("TT", "Cmdline: move cursor to start"))
kmap({ "c"           }, "<C-e>",      "<End>",                                   opts("TT", "Cmdline: move cursor to end"))
kmap({ "c", "i"      }, "<C-d>",      "<Del>",                                   opts("TT", "Delete character forward"))
kmap({ "c", "i"      }, "<C-h>",      "<BS>",                                    opts("TT", "Delete character backward"))
-- stylua: ignore end
