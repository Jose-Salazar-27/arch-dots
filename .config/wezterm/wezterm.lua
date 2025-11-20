local wezterm = require("wezterm")

local jetbrains_harfbuzz_features = {
	"cv01=0",
	"cv02=1",
	"cv03=1",
	"cv04=1",
	"cv05=1",
	"cv06=0",
	"cv07=0",
	"cv08=0",
	"cv09=0",
	"cv10=0",
	"cv11=1",
	"cv12=1",
	"cv14=1",
	"cv15=1",
	"cv16=1",
	"cv17=1",
	"cv18=1",
	"cv19=1",
	"cv20=1",
	"ss19=0",
}

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font",
		weight = "Regular",
		scale = 1.0,
		italic = false,
		-- weight = "Medium",
		harfbuzz_features = jetbrains_harfbuzz_features,
	},
	-- "Symbols Nerd Font",
})

-- For example, changing the color scheme:
config.color_scheme_dirs = { "~/.config/wezterm/themes/" }
config.color_scheme = "Catppuccin Mocha (Gogh)"

config.font = font
config.front_end = "WebGpu"
config.font_size = 14.0
-- config.freetype_load_flags = "NO_HINTING"
-- config.dpi = 110

config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false

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

-- config.enable_wayland = false
-- and finally, return the configuration to wezterm
return config
