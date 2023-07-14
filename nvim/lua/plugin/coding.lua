return {
  -- lsp
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require('lsp')
    end
  },

  { "williamboman/mason-lspconfig.nvim"
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
  },
 
  {
    "mfussenegger/nvim-dap",
    config = function()
    
      require('plugin-configs.dap')
    end,
    keys = require('keymap').dap,
  },

  { "rcarriga/nvim-dap-ui", },

  { "theHamsta/nvim-dap-virtual-text", },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function ()
      require("mason-nvim-dap").setup({
        ensure_installed = {  "delve" },
      
      })
    end
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
    -- event = 'VeryLazy',
    event = "InsertEnter",
    config = function()
      require('plugin-configs.cmp')
    end,
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-rg",
      "f3fora/cmp-spell",
      "rafamadriz/friendly-snippets"
    },
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
  },

  -- {
  --   "crispgm/nvim-go",
  --   build = ":GoInstallBinaries",
  --   config = function()
  --     require('go').setup({
  --       -- linters: revive, errcheck, staticcheck, golangci-lint
  --       linter = 'errcheck',
  --       formatter = 'gofumpt',

  --     })
  --   end
  -- },
  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('plugin-configs.gitsigns')
    end,
    keys = require('keymap').gitsigns
  },
  -- 快速建议修复
  { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
}
