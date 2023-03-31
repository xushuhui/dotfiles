return {
  {
    "folke/noice.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require('plugin-configs.notice')
    end
  },
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require('plugin-configs.nvimnotify')
    end,
  },

  { 'nvim-lua/plenary.nvim',       lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },

}
