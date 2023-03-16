local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end
db.setup({
  theme = 'doom',
  config = {
    header = {
      [[]],
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[                                                   ]],
  [[                [ version : 1.0.0 ]                ]],
  [[                                                   ]],
    },
    center = {
      {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects",
        key = '1',
        icon_hl = 'Title',
        desc_hl = 'String',
      },
      {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
        key = '2',
      },
      {
        icon = "  ",
        desc = "Find file                           ",
        action = "Telescope find_files",
        key = '3',
      },
      {
        icon = "  ",
        desc = "Find text                           ",
        action = "Telescope live_grep",
        key = '4',
      },
      {
        icon = "  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
        key='5'
      },
    
    
    },
    footer = {
      "",
      "",
      "https://github.com/xushuhui/dotfiles/nvim",
    } --your footer
  }
})


db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },

  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit .bashrc                        ",
  --   action = "edit ~/.bashrc",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Change colorscheme                  ",
  --   action = "ChangeColorScheme",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                       ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find file                           ",
  --   action = "Telescope find_files",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}
