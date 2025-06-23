vim.g.mapleader = " " -- Set leader key to space
local kmap = vim.keymap.set -- for conciseness

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


-- memo v mode置換するやつを以下の記事を参考にして改造したい。
-- https://ryota2357.com/blog/2023/neovim-custom-vim-ui-input/
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
-- Keymaps
-------------------------

-- Miscellaneous
kmap({ 'n'      },    '<leader>so,',    ':so<CR>',                                 { noremap = true, silent = true, desc = "Source current file" })
kmap({ 'i'      },    'jj',             '<ESC>',                                   { noremap = true, silent = true, desc = "Exit insert mode with jj" })

kmap({ 'n', 'x' },    'H',              '0',                                       { noremap = true, silent = true, desc = "Home row: move to line start" })
kmap({ 'n', 'x' },    'L',              '$',                                       { noremap = true, silent = true, desc = "Home row: move to line end" })
kmap({ 'n', 'x' },    'J',              '}',                                       { noremap = true, silent = true, desc = "Home row: move to next paragraph" })
kmap({ 'n', 'x' },    'K',              '{',                                       { noremap = true, silent = true, desc = "Home row: move to previous paragraph" })
kmap({ 'n', 'x' },    'x',              '"_x',                                     { noremap = true, silent = true, desc = "Delete without yanking" })
kmap({ 'n'      },    'j',              'gj',                                      { noremap = true, silent = true, desc = "Smarter line navigation down (gj)" })
kmap({ 'n'      },    'k',              'gk',                                      { noremap = true, silent = true, desc = "Smarter line navigation up (gk)" })
kmap({ 'n'      },    'o',              'o<ESC>',                                  { noremap = true, silent = true, desc = "Insert blank line below and remain in normal mode" })
kmap({ 'n'      },    'O',              'O<ESC>',                                  { noremap = true, silent = true, desc = "Insert blank line above and remain in normal mode" })
kmap({ 'x'      },    'gg',             'gg0',                                     { noremap = true, silent = true, desc = "Visual: go to first line and head" })
kmap({ 'x'      },    'G',              'G$',                                      { noremap = true, silent = true, desc = "Visual: go to last line and end" })
kmap({ 'n', 'x' },    'p',              paste_and_remove_cr('"+p'), { noremap = true, silent = true, desc = "Paste from clipboard and remove CR" })
kmap({ 'n', 'x' },    'P',              paste_and_remove_cr('"+P'), { noremap = true, silent = true, desc = "Paste from clipboard and remove CR" })

-- Search & substitution
kmap({ 'n', 'x' },    '<C-f>', [[:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>]], { noremap = false, silent = true })
--kmap({ 'x'      },    '<C-f>',          search_visual_selection,                 { noremap = true, silent = true, desc = "Search exact visual selection (dot etc allowed)" })
kmap({ 'n'      },    's',              [[:%s/<C-r>///gc<Left><Left><Left>]],    { noremap = true, silent = false, desc = "Substitute by last search pattern" })
kmap({ 'n'      },    'S',              substitute_last_search_pattern,          { noremap = true, silent = false, desc = "Substitute by last search pattern (function)" })
kmap({ 'n'      },    '<ESC>',          ":nohlsearch | echo ''<CR>",             { noremap = true, silent = false, desc = "Clear search highlights and commandline" })

-- Scrolling & screen movement
kmap({ 'n'      },    '<C-d>',          '<C-d>zz',                               { noremap = true, silent = true, desc = "Half page down and center" })
kmap({ 'n'      },    '<C-u>',          '<C-u>zz',                               { noremap = true, silent = true, desc = "Half page up and center" })
kmap({ 'n'      },    '<C-l>',          'zl',                                    { noremap = true, silent = true, desc = "Scroll screen right" })
kmap({ 'n'      },    '<C-h>',          'zh',                                    { noremap = true, silent = true, desc = "Scroll screen left" })

-- Window & tab management
kmap({ 'n'      },    '<leader>sv',     '<C-w>v',                                { noremap = true, silent = true, desc = "Split window vertically" })
kmap({ 'n'      },    '<leader>sh',     '<C-w>s',                                { noremap = true, silent = true, desc = "Split window horizontally" })
kmap({ 'n'      },    '<leader>se',     '<C-w>=',                                { noremap = true, silent = true, desc = "Make splits equal size" })
kmap({ 'n'      },    '<leader>sx',     '<cmd>close<CR>',                        { noremap = true, silent = true, desc = "Close current split" })
kmap({ 'n'      },    '<leader>to',     '<cmd>tabnew<CR>',                       { noremap = true, silent = true, desc = "Open new tab" })
kmap({ 'n'      },    '<leader>tx',     '<cmd>tabclose<CR>',                     { noremap = true, silent = true, desc = "Close current tab" })
kmap({ 'n'      },    '<leader>tn',     '<cmd>tabn<CR>',                         { noremap = true, silent = true, desc = "Go to next tab" })
kmap({ 'n'      },    '<leader>tp',     '<cmd>tabp<CR>',                         { noremap = true, silent = true, desc = "Go to previous tab" })
kmap({ 'n'      },    '<leader>tf',     '<cmd>tabnew %<CR>',                     { noremap = true, silent = true, desc = "Open current buffer in new tab" })

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
