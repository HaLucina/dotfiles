local uname = vim.uv.os_uname()
local group = vim.api.nvim_create_augroup("kyoh86-conf-ime", {})
if uname.sysname == "Linux" then
  if os.getenv("WSL_DISTRO_NAME") ~= "" then
    vim.api.nvim_create_autocmd("InsertLeave", {
      group = group,
      command = "silent! !zenhan.exe 0",
    })
  else
    -- 割愛: WSL以外の設定
    vim.api.nvim_create_autocmd("InsertLeave", { 
      callback = function()
        vim.fn.jobstart({ "fcitx-remote", "-c" })
      end,
    })
  end
else
  -- 割愛: Linux以外の設定
end
