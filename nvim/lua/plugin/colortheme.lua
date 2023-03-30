return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
   
  },
  {'echasnovski/mini.nvim', version = false,
  init = function ()
    vim.cmd.colorscheme("minischeme")
  end 
},


}