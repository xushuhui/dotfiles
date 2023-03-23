local options = {}
require('lazy').setup({
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },

    {
        'itsuki0927/base46',
        config = function()
          local ok, base46 = pcall(require, 'base46')
          if ok then
            base46.load_theme()
          end
        end,
      },
    
      {
        'NvChad/nvim-colorizer.lua',
        event = { 'CursorHold' },
        config = function()
       require('plugin-configs.colorizer')
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
        'akinsho/bufferline.nvim',
        event = { 'BufNewFile', 'BufRead', 'TabEnter' },
        config = function()
          require('plugin-configs.bufferline')
        end,
        init = function()
          require('keybinding').bufferline()
        end,
      },
    
      {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
          require('plugin-configs.alpha')
        end,
      },
    
      {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
          require('plugin-configs.gitsigns')
        end,
      },
    
      {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config = function()
          require('plugin-configs.blankline')
        end,
      },
    
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
        ---------------------------- 功能组件 ----------------------------------

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
       -- 片段
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    config = function()
      require('plugin-configs.luasnip')
    end,
  },

  -- 自动完成
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    config = function()
      require('plugin-configs.cmp')
    end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- 常见编程语言代码段
    "rafamadriz/friendly-snippets",
    },
  },

  -- 自动补全括号
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      require('plugin-configs.autopairs')
    end,
  },
   -- 格式化
   {
    'mhartington/formatter.nvim',
    event = 'BufWrite',
    config = function()
      require('plugin-configs.formatter')
    end,
  },

  -- 注释
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('plugin-configs.comment')
    end,
    init = function()
      require('keybinding').comment()
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
      'voldikss/vim-floaterm',
      cmd = { 'FloatermNew', 'FloatermToggle' },
      config = function()
        require('plugin-configs.floaterm')
      end,
      init = function()
        require('keybinding').floaterm()
      end,
    },
      -- nvim-notify
     {
        "rcarriga/nvim-notify",
        config = function()
          require('plugin-configs.nvimnotify')
        end,
      },
      {
        "Pocco81/auto-save.nvim",
        config = function()
          require('plugin-configs.auto_save')
        end,
      },
}, options)