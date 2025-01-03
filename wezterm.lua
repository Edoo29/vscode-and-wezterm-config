local wezterm = require("wezterm")
local config = wezterm.config_builder()

local grey = "#CCCCCC"
local black = "#000000"
local white = "#FFFFFF"
local transparent = "rgba(0, 0, 0, 0)"

config.default_prog = { "pwsh.exe", "-NoLogo" }
config.color_scheme = "Tokyo Night"
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.font = wezterm.font("Comic Mono")
config.font_size = 12
config.enable_tab_bar = true
config.default_cursor_style = "SteadyBlock"
config.show_new_tab_button_in_tab_bar = false
config.window_background_opacity = 0.75
config.tab_max_width = 50
config.win32_system_backdrop = "Acrylic"

config.colors = {
	tab_bar = {
		background = transparent,
	},
	cursor_bg = "#e8e8e8",
	background = black,
}

wezterm.on("format-tab-title", function(tab)
	local idx = " " .. tab.tab_index + 1 .. " "
	if tab.is_active then
		return {
			{ Background = { Color = transparent } },
			{ Foreground = { Color = white } },
			{ Text = idx },
		}
	else
		return {
			{ Background = { Color = transparent } },
			{ Foreground = { Color = grey } },
			{ Text = idx },
		}
	end
end)

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Background = { Color = transparent } },
		{ Foreground = { Color = white } },
		{ Text = "Hello, World! " },
	}))
end)

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

return config
