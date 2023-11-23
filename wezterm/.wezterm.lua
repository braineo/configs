-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.audible_bell = "Disabled"
config.scrollback_lines = 1000000

-- For example, changing the color scheme:
config.color_scheme = "Snazzy"

config.font = wezterm.font("Operator Mono", { weight = "ExtraLight" })
config.font_size = 8.0

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
  }
}

-- and finally, return the configuration to wezterm
return config
