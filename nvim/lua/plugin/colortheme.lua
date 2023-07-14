return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false, 
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end,
    opts = {
      transparent = true,
      style = "night",
      styles = {
          sidebars = "moon",
          floats = "moon",
          comments = { italic = true },
          keywords = { italic = true },
      },
  },
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('plugin-configs.mini')
    end,
   
  },


}
