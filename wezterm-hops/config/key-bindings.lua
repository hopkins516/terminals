local wezterm = require('wezterm')

return {
   { 
      key = 't', 
      mods = 'ALT', 
      action = wezterm.action.ShowTabNavigator 
   },
   { 
      key = 'l', 
      mods = 'ALT', 
      action = wezterm.action.ShowLauncher 
   },
   -- { 
   --    key = 'r',  -- 重载配置
   --    ods = 'CMD|SHIFT', 
   --    action = wezterm.action.ReloadConfiguration,
   -- },
   {
      key = 'k', -- 清理屏幕
      mods = 'CMD',
      action = wezterm.action.Multiple {
         wezterm.action.ClearScrollback 'ScrollbackAndViewport', 
         wezterm.action.SendKey { 
            key = 'L',
            mods = 'CTRL'
         }
      }
   },
   { 
      key = 'LeftArrow', -- 控制左右移动面板
      mods = 'ALT', -- Option
      action = wezterm.action {
         ActivateTabRelative = -1
      }
   },
   {
      key = 'RightArrow', -- 控制左右移动面板
      mods = 'ALT', -- Option
      action = wezterm.action {
         ActivateTabRelative = 1
      }
   },
   {
      key = 'f',  -- 搜索
      mods = 'CMD',
      action = wezterm.action.Search {
         CaseInSensitiveString = '' -- 大小写不敏感
      }
   },
   {
      key = 'n', -- 新建窗口
      mods = 'CMD',
      action = wezterm.action.SpawnCommandInNewTab {
         label = 'Zsh-NewWindow',
         args = {'/bin/zsh', '-l'}
      }
   },
   {
      key = 'd', -- 竖向分屏
      mods = 'CMD',
      action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
      },
   },
   {
      key = 'd', -- 横向分屏
      mods = 'CMD|SHIFT',
      action = wezterm.action.SplitVertical {
         domain = 'CurrentPaneDomain'
      },
   },
   {
      key = 'q',
      mods = 'CMD', --'CTRL',
      action = wezterm.action.CloseCurrentPane { 
         confirm = false
      },
   },
   -- { -- browser-like bindings for tabbing
   --    key = 't',
   --    mods = 'CTRL',
   --    action = wezterm.action({ SpawnTab = 'DefaultDomain' }),
   -- },
   -- Create a new tab in the same domain as the current pane.
   -- This is usually what you want.
   {
      key = 't',
      mods = 'SHIFT|ALT',
      action = wezterm.action.SpawnTab 'CurrentPaneDomain',
   },
   -- Create a new tab in the default domain
   { 
      key = 't', 
      mods = 'SHIFT|ALT', 
      action = wezterm.action.SpawnTab 'DefaultDomain' },
   -- Create a tab in a named domain
   {
      key = 't',
      mods = 'SHIFT|ALT',
      action = wezterm.action.SpawnTab {
      DomainName = 'unix',
      },
   },

   {
      key = 'w',
      mods = 'CMD', --'CTRL',
      action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
   },
   {
      key = 'Tab',
      mods = 'CMD', -- 'CTRL',
      action = wezterm.action({ ActivateTabRelative = 1 }),
   },
   {
      key = 'Tab',
      mods = 'CMD|SHIFT', -- 'CTRL|SHIFT',
      action = wezterm.action({ ActivateTabRelative = -1 }),
   }, -- standard copy/paste bindings
   {
      key = 'x',
      mods = 'CMD', --'CTRL',
      action = 'ActivateCopyMode',
   },
   {
      key = 'v',
      mods = 'CMD|SHIFT', -- 'CTRL|SHIFT',
      action = wezterm.action({ PasteFrom = 'Clipboard' }),
   },
   {
      key = 'c',
      mods =  'CMD|SHIFT', -- 'CTRL|SHIFT',
      action = wezterm.action({ CopyTo = 'ClipboardAndPrimarySelection' }),
   },
   {
      key = 'F',
      mods = 'CMD|SHIFT',-- 'SHIFT|CTRL',
      action = wezterm.action.Search({ CaseInSensitiveString = '' }),
   },
   {
      key = 'x',
      mods = 'CMD|SHIFT', -- 'CTRL|SHIFT',
      action = wezterm.action_callback(function(win, pane)
      wezterm.background_child_process({
         'pwsh',
         '-c',
         'x11',
      })
      end),
   },
   { 
      key = 'LeftArrow', 
      mods = 'SHIFT', 
      action = wezterm.action.SendKey { 
         key = 'b', 
         mods = 'ALT',
      },
   },
   { 
      key = 'RightArrow', 
      mods = 'SHIFT', 
      action = wezterm.action.SendKey { 
         key = 'f',
         mods = 'ALT',
      },
   },
   -- Scroll
   { key = 'B', mods = 'CTRL|SHIFT', action = wezterm.action.ScrollByPage(-1) },
   { key = 'F', mods = 'CTRL|SHIFT', action = wezterm.action.ScrollByPage(1) },
   { key = 'g', mods = 'LEADER', action = wezterm.action.ScrollToTop },
   { key = 'G', mods = 'LEADER|SHIFT', action = wezterm.action.ScrollToBottom },
   { key = 'Z', mods = 'CTRL|SHIFT', action = wezterm.action.ScrollToPrompt(-1) },
   { key = 'X', mods = 'CTRL|SHIFT', action = wezterm.action.ScrollToPrompt(1) },
   { -- 快速移动到行首行尾
        key = 'LeftArrow',
        mods = 'CMD',
        action = wezterm.action.SendKey {
            key = 'Home',
            mods = 'NONE'
        }
    }, 
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = wezterm.action.SendKey {
            key = 'End',
            mods = 'NONE'
        }
    }
}
