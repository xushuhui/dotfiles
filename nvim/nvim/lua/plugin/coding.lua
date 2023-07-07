return {
  -- lsp
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate"
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require('plugin-configs.dap')
    end,
    keys = require('keybinding').dap,
  },
  { "ldelossa/nvim-dap-projects" },
  --   {"rcarriga/nvim-dap-ui",},
  { "theHamsta/nvim-dap-virtual-text", },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    opts = require('lsp.config').opts,
    config = function()
      require('lsp')
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
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-rg",
    },
  },

  -- 自动补全括号
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   dependencies = 'hrsh7th/nvim-cmp',
  --   config = function()
  --     require('plugin-configs.autopairs')
  --   end,
  -- },
  -- 格式化
  -- { "jose-elias-alvarez/null-ls.nvim" },

  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = function()
      require('plugin-configs.symbols_outline')
    end,
  },
  -- 注释

  -- 快速建议修复
  { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
}
