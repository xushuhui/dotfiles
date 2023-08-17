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
  {
    "folke/trouble.nvim",
  },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'kkharji/lspsaga.nvim',
    config = function()
      require('plugin-configs.lspsaga')
    end
  }
}
