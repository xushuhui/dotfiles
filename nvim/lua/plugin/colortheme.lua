return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('plugin-configs.mini')
    end,
    init = function()
      vim.cmd.colorscheme("minischeme")
    end
  },


}
