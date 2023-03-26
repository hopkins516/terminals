local wezterm = require("wezterm")
local launch_menu = require("config.launch-menu")
local keybindings = require("config.key-bindings")
local shell = require("config.shell")
local dracula = require('themes.dracula');
local custom = require("themes.custom")
require("config.right-status").setup()
require("config.notify").setup()
require("config.tab-title").setup()

-- math.randomseed(os.time())
-- local hue = math.random(0, 360);

-- local font_primary = "FiraCode Nerd Font" -- "CodeNewRoman Nerd Font Mono" -- "JetBrains Mono" -- "Fira Code", "Monaco"
local font_primary = "FuraMono Nerd Font Mono" -- "JetBrains Mono" -- "Fira Code", "Monaco"

function basename(s)
   return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local function font(name, params)
   return wezterm.font(name, params)
end

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Latte"
  else
    return "Catppuccin Mocha"
  end
end

-- [[ font with fallback ]]
-- local function font_with_fallback(name, params)
--   local names = { name }
--   return wezterm.font_with_fallback(names, params)
-- end

return {
   -- fonts
   -- font = font(font_primary, {weight="Medium", stretch="Normal", italic=false}),
   -- font = font("FuraMono Nerd Font Mono", {weight="Medium", stretch="Normal", style="Normal"}),
   -- font = font("CodeNewRoman Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal"}),
   -- Monaco
   font = font("Monaco", {weight="DemiBold", stretch="Normal", style="Normal"}),
   font_size = 13,

   -- colour scheme --> Config-field: `colors`, `color_scheme`, `color_schemes`, `color_scheme_dirs`
   colors = custom, -- dracula, -- custom,
   -- "Catppuccin Mocha", -- "Macchiato", "Catppuccin Mocha", 
   -- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
   -- background
   background = {
      {
         source = { Color = custom.background },
         height = "100%",
         width = "100%",
         opacity = 1.0,
      },
      {
         -- source = { File = wezterm.config_dir .. "/backdrops/space.jpg" },
         source = { Color = custom.background },
         height = "100%",
         width = "100%",
         opacity = 0.12,
      },
   },

   -- scroll bar
   enable_scroll_bar = true,
   scrollback_lines = 20000,

   -- status
   status_update_interval = 1000,

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = false,
   tab_max_width = 25,
   show_tab_index_in_tab_bar = false,
   switch_to_last_active_tab_when_closing_tab = true,
   tab_bar_at_bottom = false,

   -- window
   window_padding = {
      left = 8,
      right = 24, --20,
      top = 6, --12,
      bottom = 8, --7,
   },
   window_close_confirmation = "NeverPrompt",
   window_frame = {
      active_titlebar_bg = "#090909",
      font = font(font_primary, { bold = true }),
      font_size = 9,
   },
   native_macos_fullscreen_mode = true,
   automatically_reload_config = true,
   adjust_window_size_when_changing_font_size = true,
   inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
   window_background_opacity = 0.96,

   -- keybindings
   send_composed_key_when_left_alt_is_pressed = true,
   send_composed_key_when_right_alt_is_pressed = false,
   disable_default_key_bindings = false, -- true
   use_dead_keys = false, -- Allow using ^ with single key press.
   keys = keybindings,

   -- mousebindings
   mouse_bindings = {
      -- Ctrl-click will open the link under the mouse cursor
      {
         event = { Up = { streak = 1, button = "Left" } },
         mods = "CTRL",
         action = wezterm.action.OpenLinkAtMouseCursor,
      },
   },

   -- shells
   -- wezterm.log_info("debug1: default_prog=" .. default_prog),
   default_prog = shell.default_prog,
   launch_menu = launch_menu,

   -- ssh
   --[[ssh_domains = ssh_domains,]]

   -- wsl
   --[[wsl_domains = {
      {
         name = "WSL:Ubuntu",
         distribution = "Ubuntu",
         username = "kevin",
         default_cwd = "/home/kevin",
         default_prog = { "fish" },
      },
   },]]
   hyperlink_rules = {
    {
      regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },
    -- {
    --   regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
    --   format = "mailto:$0",
    -- },
    {
      regex = [[\bfile://\S*\b]],

      format = "$0",
    },
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = "$0",
    },
    -- {
    --  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    --  format = "https://www.github.com/$1/$3",
    -- }
  },
}
