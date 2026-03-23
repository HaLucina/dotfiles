local wezterm = require("wezterm")
local act = wezterm.action

-- ==========================================================
-- ヘルパー関数 (判定ロジック)
-- ==========================================================
local function is_vim(pane)
	-- Neovim側から渡される変数、またはプロセス名で判定
	return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function split_nav(key, direction)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- Neovim実行中なら、Ctrl-hjklをそのまま送信（smart-splits.nvimが処理）
				win:perform_action(act.SendKey({ key = key, mods = "CTRL" }), pane)
			else
				-- それ以外（シェル等）なら、WezTermのペインを直接移動
				win:perform_action(act.ActivatePaneDirection(direction), pane)
			end
		end),
	}
end

-- ==========================================================
-- 1. モード定義 (KeyTable)
-- ==========================================================
local mode_definitions = {
	-- 【コピーモード】
	copy_mode = {
		trigger = { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
		-- LEADER + [ + key
		map = {
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "y", mods = "NONE", action = act.CopyTo("Clipboard") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{
				key = "Enter",
				mods = "NONE",
				action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
			},
		},
	},

	-- 【ペインリサイズモード】
	resize_pane_mode = {
		-- きっかけ: LEADER + s
		trigger = {
			key = "s",
			mods = "LEADER",
			action = act.ActivateKeyTable({ name = "resize_pane_mode", one_shot = false }),
		},
		-- 対応表: モード中のサイズ調整
		map = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "Enter", action = "PopKeyTable" },
			{ key = "Escape", action = "PopKeyTable" },
		},
	},
}

-- ==========================================================
-- 2. 通常のキーバインド (Workspace, Tab 等)
-- ==========================================================
local triggerless_keys = {
	workspace = {
		{
			key = "w",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
		},
		{
			key = "$",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "(wezterm) Set workspace title:",
				action = wezterm.action_callback(function(win, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
		{
			key = "W",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = "(wezterm) Create new workspace:",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
					end
				end),
			}),
		},
	},

	tabs = {
		{ key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "t", mods = "CTRL|SHIFT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "w", mods = "CTRL|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },
		-- ALT + 数字でのタブ切り替え
		{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
		{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
		{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
		{ key = "9", mods = "ALT", action = act.ActivateTab(-1) },
	},

	panes = {
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		-- --- シームレス移動の登録 ---
		split_nav("h", "Left"),
		split_nav("j", "Down"),
		split_nav("k", "Up"),
		split_nav("l", "Right"),
	},

	clipboard = {
		{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	},

	system = {
		{ key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
		{ key = "+", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	},
}

-- ==========================================================
-- 3. データの自動展開 (Wezterm形式に変換)
-- ==========================================================
local M = {}
M.keys = {}
M.key_tables = {}

for mode, key in pairs(mode_definitions) do
	table.insert(M.keys, key.trigger)
	M.key_tables[mode] = key.map
end

for _, keys in pairs(triggerless_keys) do
	for _, key in ipairs(keys) do
		table.insert(M.keys, key)
	end
end

return M
