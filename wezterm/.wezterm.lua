-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local is_mac = io.popen('uname -s','r'):read('*l') == 'Darwin'

-- This is where you actually apply your config choices

config.audible_bell = "Disabled"
config.scrollback_lines = 1000000

-- For example, changing the color scheme:
config.color_scheme = "Snazzy"

local config_font = wezterm.font("Operator Mono", { weight = is_mac and "Book" or "ExtraLight" })
local config_font_size = is_mac and 12.0 or 8.0

config.font = config_font
config.font_size = config_font_size
config.command_palette_font_size = config_font_size

config.window_background_opacity = 0.95

config.keys = {
  {
    key = "o",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },

  {
    key = "e",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
}

config.window_frame = {
  font = config_font,
  font_size = config_font_size,
}

config.check_for_updates = false

-- and finally, return the configuration to wezterm
return config
