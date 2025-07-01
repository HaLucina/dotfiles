-- lua/my/core/functions.lua

local M = {} -- M はこのモジュールが公開する関数を格納するためのテーブルです

local function M.highlight_off_and_redraw()
    vim.cmd("nohlsearch | redraw")
end

local function M.highlight_text()
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
    
local function M.open_cmdline_for_substitute()
    M.highlight_text()
    local pattern = vim.fn.getreg("/")
    local rep = string.format("%%s/%s/", pattern)
    local left3 = string.rep(vim.api.nvim_replace_termcodes("<Left>", true, false, true), 3)
    vim.api.nvim_feedkeys(":" .. rep .. "/gc" .. left3, "n", false)
end

local function M.paste_as_lf(p)
    local m = vim.fn.mode()
    local op = (p == "p") and '"+p' or '"+P'
        if m == "n" then
        vim.cmd('normal! ' .. op)
    elseif m == "v" or m == "V" or m == "\22" then
        vim.cmd('normal! "_d' .. '"+P')
    end
    vim.cmd('silent! %s/\\r//g')
end

return M
