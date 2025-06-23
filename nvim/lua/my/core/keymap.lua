vim.g.mapleader = " " -- Set leader key to space
local keymap = vim.keymap -- for conciseness

-------------------------
-- Action Functions
-------------------------

local function search_visual_selection()
    vim.cmd('normal! "zy')
    local text = tostring(vim.fn.getreg('z'))
    text = text:match('^%s*(.-)%s*$')
    if text == "" or text:find('\n') then return end
    vim.fn.setreg('/', vim.fn.escape(text, [[/\]]))
    vim.cmd('normal! n')
end

local function substitute_last_search_pattern()
    local pat = vim.fn.getreg("/")
    if pat == "" then return end
    local rep = string.format("%%s/\\V%s/", vim.fn.escape(pat, [[/\]]))
    vim.api.nvim_feedkeys(":" .. rep .. "/gc", "n", false)
    local left = vim.api.nvim_replace_termcodes("<Left>", true, false, true)
    vim.api.nvim_feedkeys(left .. left .. left, "n", false)
end

local function paste_and_remove_cr(cmd)
    vim.cmd('normal! ' .. cmd)
    vim.cmd('silent! %s/\\r//g')
end

-------------------------
-- General Keymaps Table
-------------------------

local keymaps = {
    -- Cursor movement & editing
    { modes = { 'n', 'v' }, key = 'H',                action = '0',                                        opts = { desc = "Home row: move to line start" } },
    { modes = { 'n', 'v' }, key = 'L',                action = '$',                                        opts = { desc = "Home row: move to line end" } },
    { modes = { 'n', 'v' }, key = 'J',                action = '}',                                        opts = { desc = "Home row: move to next paragraph" } },
    { modes = { 'n', 'v' }, key = 'K',                action = '{',                                        opts = { desc = "Home row: move to previous paragraph" } },
    { modes = { 'n', 'v' }, key = 'x',                action = '"_x',                                      opts = { desc = "Delete without yanking" } },
    { modes = { 'n', 'v' }, key = 's',                action = '"_s',                                      opts = { desc = "Substitute without yanking" } },
    { modes = { 'n'      }, key = 'j',                action = 'gj',                                       opts = { desc = "Smarter line navigation down (gj)" } },
    { modes = { 'n'      }, key = 'k',                action = 'gk',                                       opts = { desc = "Smarter line navigation up (gk)" } },
    { modes = { 'n'      }, key = 'o',                action = 'o<ESC>',                                   opts = { desc = "Insert blank line below and remain in normal mode" } },
    { modes = { 'n'      }, key = 'O',                action = 'O<ESC>',                                   opts = { desc = "Insert blank line above and remain in normal mode" } },
    { modes = { 'v'      }, key = 'gg',               action = 'gg0',                                      opts = { desc = "Visual: go to first line and head" } },
    { modes = { 'v'      }, key = 'G',                action = 'G$',                                       opts = { desc = "Visual: go to last line and end" } },
    { modes = { 'n', 'v' }, key = 'p',                action = function() paste_and_remove_cr('"+p') end,  opts = { desc = "Paste from clipboard and remove CR" } },
    { modes = { 'n', 'v' }, key = 'P',                action = function() paste_and_remove_cr('"+P') end,  opts = { desc = "Paste from clipboard and remove CR" } },
    -- Search & substitution
    { modes = { 'n'      }, key = '<C-f>',            action = 'g*',                                       opts = { desc = "Exact match search under cursor" } },
    { modes = { 'v'      }, key = '<C-f>',            action = search_visual_selection,                    opts = { desc = "Search exact visual selection (dot etc allowed)" } },
    { modes = { 'n'      }, key = 's',                action = [[:%s/<C-r>///gc<Left><Left><Left>]],       opts = { desc = "Substitute by last search pattern",               silent = false } },
    { modes = { 'n'      }, key = 'S',                action = substitute_last_search_pattern,             opts = { desc = "Substitute by last search pattern (function)",    silent = false } },
    { modes = { 'n'      }, key = '<ESC>',            action = ":nohlsearch | echo ''<CR>",                opts = { desc = "Clear search highlights and commandline",         silent = false } },
    -- Scrolling & screen movement
    { modes = { 'n'      }, key = '<C-d>',            action = '<C-d>zz',                                  opts = { desc = "Half page down and center" } },
    { modes = { 'n'      }, key = '<C-u>',            action = '<C-u>zz',                                  opts = { desc = "Half page up and center" } },
    { modes = { 'n'      }, key = '<C-l>',            action = 'zl',                                       opts = { desc = "Scroll screen right" } },
    { modes = { 'n'      }, key = '<C-h>',            action = 'zh',                                       opts = { desc = "Scroll screen left" } },
    -- Window & tab management
    { modes = { 'n'      }, key = '<leader>sv',       action = '<C-w>v',                                   opts = { desc = "Split window vertically" } },
    { modes = { 'n'      }, key = '<leader>sh',       action = '<C-w>s',                                   opts = { desc = "Split window horizontally" } },
    { modes = { 'n'      }, key = '<leader>se',       action = '<C-w>=',                                   opts = { desc = "Make splits equal size" } },
    { modes = { 'n'      }, key = '<leader>sx',       action = '<cmd>close<CR>',                           opts = { desc = "Close current split" } },
    { modes = { 'n'      }, key = '<leader>to',       action = '<cmd>tabnew<CR>',                          opts = { desc = "Open new tab" } },
    { modes = { 'n'      }, key = '<leader>tx',       action = '<cmd>tabclose<CR>',                        opts = { desc = "Close current tab" } },
    { modes = { 'n'      }, key = '<leader>tn',       action = '<cmd>tabn<CR>',                            opts = { desc = "Go to next tab" } },
    { modes = { 'n'      }, key = '<leader>tp',       action = '<cmd>tabp<CR>',                            opts = { desc = "Go to previous tab" } },
    { modes = { 'n'      }, key = '<leader>tf',       action = '<cmd>tabnew %<CR>',                        opts = { desc = "Open current buffer in new tab" } },
    -- Miscellaneous
    { modes = { 'n'      }, key = '<leader><leader>', action = ':so<CR>',                                  opts = { desc = "Source current file" } },
    { modes = { 'i'      }, key = 'jj',               action = '<ESC>',                                    opts = { desc = "Exit insert mode with jj" } },
}

-------------------------
-- Keymap Option Merge Utility
-------------------------

local function merge_opts(custom)
    local base = { noremap = true, silent = true }
    if not custom then return base end
    local merged = {}
    for k, v in pairs(base) do merged[k] = v end
    for k, v in pairs(custom) do merged[k] = v end
    return merged
end

-------------------------
-- Register Keymaps
-------------------------

for _, m in ipairs(keymaps) do
    for _, mode in ipairs(m.modes) do
        keymap.set(mode, m.key, m.action, merge_opts(m.opts))
    end
end

-------------------------
-- Fileformat autocmd (Separate)
-------------------------

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.bo.fileformat = "unix"
    end,
    desc = "Always save files with unix (LF) line endings",
})


