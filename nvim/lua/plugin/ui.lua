return {
  {
    "folke/noice.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require('plugin-configs.noice')
    end,
  },
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require('plugin-configs.nvimnotify')
    end,
  },

  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'kkharji/lspsaga.nvim',
    config = function()
      require('lsp.ui')
    end
  }
}
