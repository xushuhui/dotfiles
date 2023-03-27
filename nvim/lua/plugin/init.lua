local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local options = {}
require('lazy').setup({
 
  require("plugin.colortheme"),
  require('plugin.editor'),
  
  require('plugin.ui'),
  require('plugin.coding'),

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('plugin-configs.gitsigns')
    end,
  },



}, options)
