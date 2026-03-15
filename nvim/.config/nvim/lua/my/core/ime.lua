local uname = vim.uv.os_uname()
local group = vim.api.nvim_create_augroup("neovim-ime-toggle", {})
if uname.sysname == "Linux" then
  if os.getenv("WSL_DISTRO_NAME") ~= "" then -- WSLでの設定
    -- 参考> https://zenn.dev/vim_jp/articles/a8d4b091cd89f5
    -- 以下の設定がされていること前提
    -- $ gh --repo kyoh86/zenhan release download -p '*.exe' -O ~/dotfiles/esl/bin/zenhan.exe 
    -- $ chmod +x ~/.local/bin/zenhan.exe 
    -- Insertモードから抜けるときにIMEを自動でオフにする
    vim.api.nvim_create_autocmd("InsertLeave", {
      group = group,
      command = "silent! !zenhan.exe 0",
    })
  else
    -- 割愛: WSL以外の設定
  end
else
  -- 割愛: Linux以外の設定
end
