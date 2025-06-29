vim.g.mapleader = " " -- Set leader key to space

-------------------------
-- Action Functions
-------------------------
local function highlight_off_and_redraw()
    vim.cmd("nohlsearch | redraw")
end

local function higtlight_text()
    local pattern
    local text
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" or mode == "\22" then
        vim.cmd('normal! "zy')
        text = tostring(vim.fn.getreg('z'))
        text = text:match('^%s*(.-)%s*$')
        if text == "" or text:find('\n') then return end
        pattern = "\\V" .. vim.fn.escape(text, [[\]])
    else
        text = vim.fn.expand("<cword>")
        pattern = "\\<" .. text .. "\\>"
    end
    vim.fn.setreg("/", pattern)
    vim.opt.hlsearch = true
end
    
local function open_cmdline_for_substitute()
    highlight_text()
    local pattern = vim.fn.getreg("/")
    if pattern == "" then return end
    local rep = string.format("%%s/%s/", pattern)
    vim.api.nvim_feedkeys(":" .. rep .. "/gc", "n", false)
    local left = vim.api.nvim_replace_termcodes("<Left>", true, false, true)
    vim.api.nvim_feedkeys(left .. left .. left, "n", false)
end

-- ノーマル/ビジュアルでp
local function smart_paste_p()
    local m = vim.api.nvim_get_mode().mode
    if m == "n" then
        vim.cmd('normal! "+p')
        vim.cmd('silent! %s/\\r//g')
    elseif m == "v" or m == "V" or m == "\22" then
        vim.cmd('normal! "_d"0P')
    end
end

-- ノーマル/ビジュアルでP
local function smart_paste_P()
    local m = vim.api.nvim_get_mode().mode
    if m == "n" then
        vim.cmd('normal! "+P')
        vim.cmd('silent! %s/\\r//g')
    elseif m == "v" or m == "V" or m == "\22" then
        vim.cmd('normal! "_d"0P')
    end
end

-------------------------
-- Keymaps
-------------------------

local kmap = vim.keymap.set


-----| Mode             | Keys         | Command                           | Description
-----|------------------|--------------|-----------------------------------|--------------
kmap( { 'n', 'x',     }, '<leader>so,', ':so<CR>',                          { noremap = true,  silent = true,  desc = "Source current file" })
kmap( { 'i',          }, 'jj',          '<ESC>',                            { noremap = true,  silent = true,  desc = "Exit insert mode with jj" })
kmap( { 'n', 'x',     }, ';',           ':',                                { noremap = true,  silent = false, desc = "Remap ; to :" })
kmap( { 'n', 'x', 'o' }, ':',           ';',                                { noremap = true,  silent = false, desc = "Remap : to ;" })

kmap( { 'i',          }, '<C-d>',       '<Del>',                            { noremap = true,  silent = true,  desc = "Insert: <C-d> as <Del>" })
kmap( { 'i',          }, '<C-h>',       '<BS>',                             { noremap = true,  silent = true,  desc = "Insert: <C-h> as <BS>" })
kmap( { 'n',          }, 'c',           '"_c',                              { noremap = true,  silent = true,  desc = "Change without yanking" })

kmap( { 'n', 'x',     }, 'H',           '0',                                { noremap = true,  silent = true,  desc = "Home row: move to line start" })
kmap( { 'n', 'x',     }, 'L',           '$',                                { noremap = true,  silent = true,  desc = "Home row: move to line end" })
kmap( { 'n', 'x',     }, 'J',           '}zz',                                { noremap = true,  silent = true,  desc = "Home row: move to next paragraph" })
kmap( { 'n', 'x',     }, 'K',           '{zz',                                { noremap = true,  silent = true,  desc = "Home row: move to previous paragraph" })
kmap( { 'n', 'x',     }, 'x',           '"_x',                              { noremap = true,  silent = true,  desc = "Delete without yanking" })
kmap( { 'n',          }, 'j',           'gj',                               { noremap = true,  silent = true,  desc = "Smarter line navigation down (gj)" })
kmap( { 'n',          }, 'k',           'gk',                               { noremap = true,  silent = true,  desc = "Smarter line navigation up (gk)" })
kmap( { 'n',          }, 'o',           'o<ESC>',                           { noremap = true,  silent = true,  desc = "Insert blank line below and remain in normal mode" })
kmap( { 'n',          }, 'O',           'O<ESC>',                           { noremap = true,  silent = true,  desc = "Insert blank line above and remain in normal mode" })
kmap( { 'x',          }, 'gg',          'gg0',                              { noremap = true,  silent = true,  desc = "Visual: go to first line and head" })
kmap( { 'x',          }, 'G',           'G$',                               { noremap = true,  silent = true,  desc = "Visual: go to last line and end" })

-- Paste
kmap( { 'n', 'v',     }, 'p',           smart_paste_p,                      { noremap = true,  silent = true,  desc = "Paste from clipboard and remove CR / Visual: paste without yanking selection" })
kmap( { 'n', 'v',     }, 'P',           smart_paste_P,                      { noremap = true,  silent = true,  desc = "Paste from clipboard and remove CR / Visual: paste without yanking selection (reverse)" })


-- Move line(s) up/down
kmap( { 'n',          }, '<C-k>',       '"zdd<Up>"zP',                      { noremap = true,  silent = true,  desc = "Move current line up" })
kmap( { 'n',          }, '<C-j>',       '"zdd"zp',                          { noremap = true,  silent = true,  desc = "Move current line down" })
kmap( { 'x',          }, '<C-k>',       '"zx<Up>"zP`[V`]',                  { noremap = true,  silent = true,  desc = "Move selected lines up" })
kmap( { 'x',          }, '<C-j>',       '"zx"zp`[V`]',                      { noremap = true,  silent = true,  desc = "Move selected lines down" })

-- Search & substitution
kmap( { 'n', 'x',     }, '<C-f>',       higtlight_text,          { noremap = true,  silent = true,  desc = "Highlight word under cursor (cmd input)" })
kmap( { 'n', 'x',     }, 's',           open_cmdline_for_substitute,   { noremap = true,  silent = false, desc = "Substitute by last search pattern (cmd input)" })
kmap( { 'n',          }, '<ESC>',       highlight_off_and_redraw,           { noremap = true,  silent = true,  desc = "Clear search highlights and redraw (cmd input)" })

-- Scrolling & screen movement
kmap( { 'n',          }, '<C-d>',       '<C-d>zz',                          { noremap = true,  silent = true,  desc = "Half page down and center" })
kmap( { 'n',          }, '<C-u>',       '<C-u>zz',                          { noremap = true,  silent = true,  desc = "Half page up and center" })
kmap( { 'n',          }, '<C-l>',       'zl',                               { noremap = true,  silent = true,  desc = "Scroll screen right" })
kmap( { 'n',          }, '<C-h>',       'zh',                               { noremap = true,  silent = true,  desc = "Scroll screen left" })

-- Window & tab management
kmap( { 'n',          }, '<leader>sv',  '<C-w>v',                           { noremap = true,  silent = true,  desc = "Split window vertically" })
kmap( { 'n',          }, '<leader>sh',  '<C-w>s',                           { noremap = true,  silent = true,  desc = "Split window horizontally" })
kmap( { 'n',          }, '<leader>se',  '<C-w>=',                           { noremap = true,  silent = true,  desc = "Make splits equal size" })
kmap( { 'n',          }, '<leader>sx',  '<cmd>close<CR>',                   { noremap = true,  silent = true,  desc = "Close current split" })
kmap( { 'n',          }, '<leader>to',  '<cmd>tabnew<CR>',                  { noremap = true,  silent = true,  desc = "Open new tab" })
kmap( { 'n',          }, '<leader>tx',  '<cmd>tabclose<CR>',                { noremap = true,  silent = true,  desc = "Close current tab" })
kmap( { 'n',          }, '<leader>tn',  '<cmd>tabn<CR>',                    { noremap = true,  silent = true,  desc = "Go to next tab" })
kmap( { 'n',          }, '<leader>tp',  '<cmd>tabp<CR>',                    { noremap = true,  silent = true,  desc = "Go to previous tab" })
kmap( { 'n',          }, '<leader>tf',  '<cmd>tabnew %<CR>',                { noremap = true,  silent = true,  desc = "Open current buffer in new tab" })

-- Command-line mode keymaps: Comfortable cursor movement in command-line mode
kmap( { 'c',          }, '<C-p>',       '<Up>',                             { noremap = true,  silent = true,  desc = "Cmdline: move up in history" })
kmap( { 'c',          }, '<C-n>',       '<Down>',                           { noremap = true,  silent = true,  desc = "Cmdline: move down in history" })
kmap( { 'c',          }, '<C-b>',       '<Left>',                           { noremap = true,  silent = true,  desc = "Cmdline: move left" })
kmap( { 'c',          }, '<C-f>',       '<Right>',                          { noremap = true,  silent = true,  desc = "Cmdline: move right" })
kmap( { 'c',          }, '<C-a>',       '<Home>',                           { noremap = true,  silent = true,  desc = "Cmdline: move to start" })
kmap( { 'c',          }, '<C-e>',       '<End>',                            { noremap = true,  silent = true,  desc = "Cmdline: move to end" })
kmap( { 'c',          }, '<C-d>',       '<Del>',                            { noremap = true,  silent = true,  desc = "Cmdline: delete character" })

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
