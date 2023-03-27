return {
    {
        'folke/todo-comments.nvim',
        event = 'BufRead',
        lazy = true,
        config = function()
          require('plugin-configs.todo_comments')
        end,
        init = function()
          require('keybinding').todo_comments()
        end,
      },
       -- 目录树
  {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
      require('plugin-configs.nvimtree')
    end,
    init = function()
      require('keybinding').nvimtree()
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require('plugin-configs.auto_save')
    end,
  },
  {"rmagatti/auto-session",
  config = function ()
    require("auto-session").setup({
      log_level = "error",
      -- 打开这些目录里面的内容时，不加载会话
      auto_session_suppress_dirs = {"~/", "~/Projects", "~/Downloads", "/", "/ect", "/usr"},
      auto_session_allowed_dirs = {"~/internal","~/www"},
      auto_session_enable_last_session = false,
      -- 保存session文件到 ~/.local/share/nvim/sessions目录
      auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = nil,
      auto_restore_enabled = nil,
      auto_session_use_git_branch = nil,
      -- the configs below are lua only
      bypass_session_save_file_types = nil
  })
  end
},
    -- 模糊搜索
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        config = function()
          require('plugin-configs.telescope')
        end,
        init = function()
          require('keybinding').telescope()
        end,
      },
      -- 浮窗
      {
        'voldikss/vim-floaterm',
        cmd = { 'FloatermNew', 'FloatermToggle' },
        config = function()
          require('plugin-configs.floaterm')
        end,
        init = function()
          require('keybinding').floaterm()
        end,
      },

      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = 'BufRead',
      },
      {
        'nvim-treesitter/nvim-treesitter',
        event = 'CursorHold',
        build = ':TSUpdate',
        config = function()
         require('plugin-configs.treesitter')
        end,
      },
}