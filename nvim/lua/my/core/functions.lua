-- M is a table to store functions exposed by this module.
local M = {}

-- Annotation for the above line:
-- Since Neovim uses LuaJIT 2.1 (which is compatible with Lua 5.1),
-- this line ensures compatibility with 'table.unpack', the standard
-- way to use unpack in Lua 5.2 and later versions.
local unpack = table.unpack or unpack

function M.dispatch(func, ...)
    local args = { ... }
    return function()
        func(unpack(args))
    end
end

M.highlight_text = function()
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

M.open_cmdline_for_substitute = function()
    M.highlight_text()
    local pattern = vim.fn.getreg("/")
    local rep = string.format("%%s/%s/", pattern)
    local left3 = string.rep(vim.api.nvim_replace_termcodes("<Left>", true, false, true), 3)
    vim.api.nvim_feedkeys(":" .. rep .. "/gc" .. left3, "n", false)
end

M.paste_force_lf = function(key)
    local m = vim.fn.mode()
    key = (key == "p") and '"+p' or '"+P'
    if m == "v" or m == "V" or m == "\22" then
        vim.cmd('normal! "_d' .. '"+P')
    else -- 
        vim.cmd('normal! ' .. key)
    end
    vim.cmd('silent! %s/\\r//g')
end

M.open_path = function()
    return 0
end

return M
