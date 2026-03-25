-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local is_mac = io.popen("uname -s", "r"):read("*l") == "Darwin"

local function get_split_pane_args(pane)
  local process = pane:get_foreground_process_info()
  local args = {}
  wezterm.log_info(process)
  if process then
    if process.name == "ssh" then
      args = process.argv
    -- only handle docker exec
    elseif process.name == "docker" then
      local is_exec = false
      for _, arg in ipairs(process.argv) do
        if arg == "exec" then
          is_exec = true
          break
        end
      end
      if is_exec then
        args = process.argv
      end
    end
  end
  return args
end

-- This is where you actually apply your config choices

config.audible_bell = "Disabled"
config.scrollback_lines = 1000000

-- For example, changing the color scheme:
config.color_scheme = "Snazzy"

local config_font = wezterm.font_with_fallback({
  { family = "JetBrains Mono" },
  { family = "Noto Color Emoji" },
  { family = "Symbols Nerd Font Mono" },

  { family = "LXGW Neo XiHei" },
  { family = "WenQuanYi Micro Hei" },
})

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
    key = "o",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action_callback(function(window, pane)
      local something = get_split_pane_args(pane)
      window:perform_action(
        wezterm.action.SplitVertical({
          domain = "CurrentPaneDomain",
          args = get_split_pane_args(pane),
        }),
        pane
      )
    end),
  },

  {
    key = "e",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },

  {
    key = "e",
    mods = "CTRL|SHIFT|ALT",

    action = wezterm.action_callback(function(window, pane)
      local something = get_split_pane_args(pane)
      window:perform_action(
        wezterm.action.SplitHorizontal({
          domain = "CurrentPaneDomain",
          args = get_split_pane_args(pane),
        }),
        pane
      )
    end),
  },
}

config.window_frame = {
  font = config_font,
  font_size = config_font_size,
}

config.check_for_updates = false

-- and finally, return the configuration to wezterm
return config
