-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"
config.font = wezterm.font("Iosevka NF")
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false

-- start wezterm with fish shell instead of use zsh
config.default_prog = { "/usr/bin/fish", "-l" }

config.enable_wayland = false
-- and finally, return the configuration to wezterm
return config
