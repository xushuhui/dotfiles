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
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('plugin-configs.toggleterm')
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
  {
    "romgrk/nvim-treesitter-context",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("treesitter-context").setup({
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
}

