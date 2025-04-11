-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme_dirs = { "~/.config/wezterm/themes/" }
-- config.color_scheme = "tokyonight_night"
config.color_scheme = "Catppuccin Mocha (Gogh)"

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.front_end = "WebGpu"
config.font_size = 14.0

config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- start wezterm with fish shell instead of use zsh
-- config.default_prog = { "/usr/bin/fish", "-l" }

-- wezterm.on('gui-startup', function(cmd)
--     wezterm.run_command("~/.local/bin/tmux-fish.sh")
-- end)

config.enable_wayland = false
-- and finally, return the configuration to wezterm
return config
