return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
  
    init = function ()
      pcall(vim.cmd, "colorscheme " .. "tokyonight")
     end
  },



}