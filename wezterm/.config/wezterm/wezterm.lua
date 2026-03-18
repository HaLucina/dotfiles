-- 参考: https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 200 -- Screen width
config.initial_rows = 60 -- Screen height

--[[ Reasoning for initial_cols=200, initial_rows=60:
 These are approximate values assuming JetBrainsMono Nerd Font Mono 10pt on a Full HD (1920x1080) display.
 Calculation process:
 1. Screen resolution: 1920x1080 px
 2. Font size: 10pt (character width ≈ 9px, character height ≈ 18px)
 3. Number of columns (cols) = floor(1920 / 9) ≈ 213 → rounded down to 200 for some margin
 4. Number of rows (rows) = floor(1080 / 18) ≈ 60
 ]]

----------------------------------------------------
-- base
----------------------------------------------------
config.font = wezterm.font_with_fallback({
	-- Language EN
	{ family = "JetBrainsMono Nerd Font Mono", weight = "Medium" },
	-- Force JP font to fix punctuation alignment (preventing center-aligned '。' from TC fonts)
	-- Explicitly prioritizes the JP variant over TC to ensure correct glyph positioning.
	{ family = "Noto Sans CJK JP", scale = 0.9 },
})
config.font_size = 10
config.line_height = 0.90
config.window_background_opacity = 0.8
config.color_scheme = "GitHub Dark"
config.automatically_reload_config = true
config.use_ime = true

----------------------------------------------------
-- UI ($HOME/dotfiles/wezterm/.config/wezterm/ui.lua)
----------------------------------------------------
require("ui")

config.window_decorations = "NONE"
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.window_background_gradient = {
	colors = { "#000000" },
}
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

----------------------------------------------------
-- keybinds ($HOME/dotfiles/wezterm/.config/wezterm/keybinds.lua)
----------------------------------------------------

config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config
