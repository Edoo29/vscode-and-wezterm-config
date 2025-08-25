local wezterm = require("wezterm")
local config = wezterm.config_builder()

local black = "#121212"
local black_darker = "#090909"
local white = "#FFFFFF"
local red = "#BF616A"
local blue = "#81A1C1"
local transparent = "rgba(0, 0, 0, 0)"

config.default_prog = { "pwsh.exe", "-NoLogo" }
config.color_scheme = "Ashes (dark) (terminal.sexy)"
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 13
config.enable_tab_bar = true
config.default_cursor_style = "SteadyBlock"
config.show_new_tab_button_in_tab_bar = false
config.cursor_blink_rate = 0
config.window_background_opacity = 0.85
config.tab_max_width = 50
config.win32_system_backdrop = "Acrylic"

config.window_background_image_hsb = {
  brightness = 0.05,
}

config.colors = {
	tab_bar = {
		background = transparent,
	},
	cursor_bg = "#e8e8e8",

	background = black
}

wezterm.on("format-tab-title", function(tab)
	local idx = " " .. tab.tab_index + 1 .. " "
	if tab.is_active then
		return {
			{ Background = { Color = red } },
			{ Foreground = { Color = black_darker } },
			{ Text = idx },
		}
	else
		return {
			{ Background = { Color = transparent } },
			{ Foreground = { Color = blue } },
			{ Text = idx },
		}
	end
end)

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Background = { Color = black_darker } },
		{ Foreground = { Color = white } },
		{ Text = "" },
	}))
end)

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
