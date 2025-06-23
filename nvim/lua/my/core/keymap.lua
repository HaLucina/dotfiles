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
local function cmd_substitute_last_search_pattern()
    local pat = vim.fn.getreg("/")
    if pat == "" then return end
    local rep = string.format("%%s/\\V%s/", vim.fn.escape(pat, [[/\]]))
    vim.api.nvim_feedkeys(":" .. rep .. "/gc", "n", false)
    local left = vim.api.nvim_replace_termcodes("<Left>", true, false, true)
    vim.api.nvim_feedkeys(left .. left .. left, "n", false)
end

-- 1. カーソル下の単語でハイライト (Vimコマンドを入力する)
local function cmd_input_highlight_cword()
    vim.api.nvim_feedkeys(
        ":let @/ = '\\<' . expand('<cword>') . '\\>'<CR>:set hlsearch<CR>",
        "n",
        false
    )
end

-- 2. 直前の検索パターンで置換 (Vimコマンドを入力する)
local function cmd_input_substitute_last_search()
    vim.api.nvim_feedkeys(":%s/<C-r>///gc<Left><Left><Left>", "n", false)
end

-- 3. 検索ハイライトを消す (Vimコマンドを入力する)
local function cmd_input_clear_hlsearch()
    vim.api.nvim_feedkeys(":nohlsearch | echo ''<CR>", "n", false)
end

local function paste_and_remove_cr(cmd)
    vim.cmd('normal! ' .. cmd)
    vim.cmd('silent! %s/\\r//g')
end

-------------------------
-- Keymaps
-------------------------

-- Miscellaneous
kmap({ 'n'      },    '<leader>so,',    ':so<CR>',                              { noremap = true, silent = true, desc = "Source current file" })
kmap({ 'i'      },    'jj',             '<ESC>',                                { noremap = true, silent = true, desc = "Exit insert mode with jj" })
kmap({ 'n', 'x' },    ';',              ':',                                    { noremap = true, silent = false, desc = "Remap ; to :" })
kmap({ 'n', 'x', 'o'}, ':',             ';',                                    { noremap = true, silent = false, desc = "Remap : to ;" })

kmap({ 'n', 'x' },    'H',              '0',                                    { noremap = true, silent = true, desc = "Home row: move to line start" })
kmap({ 'n', 'x' },    'L',              '$',                                    { noremap = true, silent = true, desc = "Home row: move to line end" })
kmap({ 'n', 'x' },    'J',              '}',                                    { noremap = true, silent = true, desc = "Home row: move to next paragraph" })
kmap({ 'n', 'x' },    'K',              '{',                                    { noremap = true, silent = true, desc = "Home row: move to previous paragraph" })
kmap({ 'n', 'x' },    'x',              '"_x',                                  { noremap = true, silent = true, desc = "Delete without yanking" })
kmap({ 'n'      },    'j',              'gj',                                   { noremap = true, silent = true, desc = "Smarter line navigation down (gj)" })
kmap({ 'n'      },    'k',              'gk',                                   { noremap = true, silent = true, desc = "Smarter line navigation up (gk)" })
kmap({ 'n'      },    'o',              'o<ESC>',                               { noremap = true, silent = true, desc = "Insert blank line below and remain in normal mode" })
kmap({ 'n'      },    'O',              'O<ESC>',                               { noremap = true, silent = true, desc = "Insert blank line above and remain in normal mode" })
kmap({ 'x'      },    'gg',             'gg0',                                  { noremap = true, silent = true, desc = "Visual: go to first line and head" })
kmap({ 'x'      },    'G',              'G$',                                   { noremap = true, silent = true, desc = "Visual: go to last line and end" })
kmap({ 'n', 'x' },    'p',              paste_and_remove_cr('"+p'),             { noremap = true, silent = true, desc = "Paste from clipboard and remove CR" })
kmap({ 'n', 'x' },    'P',              paste_and_remove_cr('"+P'),             { noremap = true, silent = true, desc = "Paste from clipboard and remove CR" })

-- Move line(s) up/down
kmap({ 'n'      },    '<C-k>',          '"zdd<Up>"zP',                          { noremap = true, silent = true, desc = "Move current line up" })
kmap({ 'n'      },    '<C-j>',          '"zdd"zp',                              { noremap = true, silent = true, desc = "Move current line down" })
kmap({ 'x'      },    '<C-k>',          '"zx<Up>"zP`[V`]',                      { noremap = true, silent = true, desc = "Move selected lines up" })
kmap({ 'x'      },    '<C-j>',          '"zx"zp`[V`]',                          { noremap = true, silent = true, desc = "Move selected lines down" })

-- Search & substitution
kmap({ 'n', 'x' },    '<C-f>',          cmd_input_highlight_cword,              { noremap = true, silent = true,  desc = "Highlight word under cursor (cmd input)" })
kmap({ 'n'      },    's',              cmd_input_substitute_last_search,       { noremap = true, silent = false, desc = "Substitute by last search pattern (cmd input)" })
kmap({ 'n'      },    '<ESC>',          cmd_input_clear_hlsearch,               { noremap = true, silent = false, desc = "Clear search highlights and commandline (cmd input)" })
kmap({ 'n'      },    'S',              cmd_substitute_last_search_pattern,     { noremap = true, silent = false, desc = "Substitute by last search pattern (function)" })

-- Scrolling & screen movement
kmap({ 'n'      },    '<C-d>',          '<C-d>zz',                              { noremap = true, silent = true, desc = "Half page down and center" })
kmap({ 'n'      },    '<C-u>',          '<C-u>zz',                              { noremap = true, silent = true, desc = "Half page up and center" })
kmap({ 'n'      },    '<C-l>',          'zl',                                   { noremap = true, silent = true, desc = "Scroll screen right" })
kmap({ 'n'      },    '<C-h>',          'zh',                                   { noremap = true, silent = true, desc = "Scroll screen left" })

-- Window & tab management
kmap({ 'n'      },    '<leader>sv',     '<C-w>v',                               { noremap = true, silent = true, desc = "Split window vertically" })
kmap({ 'n'      },    '<leader>sh',     '<C-w>s',                               { noremap = true, silent = true, desc = "Split window horizontally" })
kmap({ 'n'      },    '<leader>se',     '<C-w>=',                               { noremap = true, silent = true, desc = "Make splits equal size" })
kmap({ 'n'      },    '<leader>sx',     '<cmd>close<CR>',                       { noremap = true, silent = true, desc = "Close current split" })
kmap({ 'n'      },    '<leader>to',     '<cmd>tabnew<CR>',                      { noremap = true, silent = true, desc = "Open new tab" })
kmap({ 'n'      },    '<leader>tx',     '<cmd>tabclose<CR>',                    { noremap = true, silent = true, desc = "Close current tab" })
kmap({ 'n'      },    '<leader>tn',     '<cmd>tabn<CR>',                        { noremap = true, silent = true, desc = "Go to next tab" })
kmap({ 'n'      },    '<leader>tp',     '<cmd>tabp<CR>',                        { noremap = true, silent = true, desc = "Go to previous tab" })
kmap({ 'n'      },    '<leader>tf',     '<cmd>tabnew %<CR>',                    { noremap = true, silent = true, desc = "Open current buffer in new tab" })

-- Command-line mode keymaps: Comfortable cursor movement in command-line mode
kmap({ 'c'      },    '<C-p>',          '<Up>',                                 { noremap = true, desc = "Cmdline: move up in history" })
kmap({ 'c'      },    '<C-n>',          '<Down>',                               { noremap = true, desc = "Cmdline: move down in history" })
kmap({ 'c'      },    '<C-b>',          '<Left>',                               { noremap = true, desc = "Cmdline: move left" })
kmap({ 'c'      },    '<C-f>',          '<Right>',                              { noremap = true, desc = "Cmdline: move right" })
kmap({ 'c'      },    '<C-a>',          '<Home>',                               { noremap = true, desc = "Cmdline: move to start" })
kmap({ 'c'      },    '<C-e>',          '<End>',                                { noremap = true, desc = "Cmdline: move to end" })
kmap({ 'c'      },    '<C-d>',          '<Del>',                                { noremap = true, desc = "Cmdline: delete character" })

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
