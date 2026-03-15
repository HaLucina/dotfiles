-- 実行環境を判定する関数
local function detect_environment()
	local env = {}
	env.is_linux = vim.fn.has("unix") == 1 and vim.fn.has("wsl") ~= 1
	env.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
	env.is_wsl = vim.fn.has("wsl") == 1
	env.is_vscode = vim.g.vscode ~= nil
	return env
end

local env = detect_environment()

-- IMEを強制的に英語（US配列）にする関数
local function ime_off()
	if env.is_linux then
		-- Fedora/IBus環境用
		vim.fn.system("ibus engine xkb:us::eng")
	elseif env.is_vscode or env.is_wsl or env.is_windows then
		-- WSL/Windows環境用（zenhanを使用）
		vim.fn.system("zenhan.exe 0")
	end
end

-- オートコマンドの設定
local ime_group = vim.api.nvim_create_augroup("ImeAutoOff", { clear = true })

-- 挿入モードを抜けた時、コマンドラインを抜けた時にIMEをオフにする
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
	group = ime_group,
	callback = function()
		ime_off()
	end,
})

-- (オプション) Linux環境でshellのログイン設定が必要な場合のみ
if env.is_wsl then
	vim.o.shell = "/usr/bin/bash --login"
elseif env.is_windows and not env.is_vscode then
	vim.o.shell = "cmd.exe"
end
