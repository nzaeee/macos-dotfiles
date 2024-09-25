local wezterm = require 'wezterm'

local config = {
    color_scheme = 'Catppuccin Mocha',
    enable_tab_bar = false,
    font_size = 14.0,
    font = wezterm.font('JetBrainsMono Nerd Font'),
    default_cursor_style = 'BlinkingBar',
    macos_window_background_blur = 30,
    window_background_opacity = 0.8,
    window_decorations = 'RESIZE',
    keys = {
        {
            key = 'f',
            mods = 'CTRL',
            action = wezterm.action.ToggleFullScreen,
        },
        {
            key = '\'',
            mods = 'CTRL',
            action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
        },
    },
    mouse_bindings = {
      {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
      },
    },
}

-- Set PowerShell as default shell only for Windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {'pwsh.exe', '-NoLogo'}
    config.launch_menu = {
        {
            label = "PowerShell",
            args = {"pwsh", "-NoLogo"},
        },
    }
end

return config
