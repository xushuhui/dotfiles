return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false, 
    
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
  'Mofiqul/dracula.nvim',
  lazy = false,
  init = function()
    vim.cmd.colorscheme("dracula")
  end,
 },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('plugin-configs.mini')
    end,
   
  },


}
