local autocmd = vim.api.nvim_create_autocmd
-- 高亮复制的内容
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
local saveable_type = { "*.go", "*.py", "*.lua", "*.js", "*.jsx", "*.ts", "*.tsx" }
autocmd('FileType', {
  pattern = 'alpha',
  callback = function()
    vim.opt.laststatus = 0
  end,
})


autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch' })
  end,
  group = highlight_group,
  pattern = '*',
})

autocmd('BufUnload', {
  buffer = 0,
  callback = function()
    vim.opt.laststatus = 3
  end,
})

autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o',
})
-- 保存时自动格式化
autocmd("BufWritePre", {
    group = myAutoGroup,
    pattern = saveable_type,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
  
  -- 
autocmd('InsertLeave', {
  callback = function()
    -- if
    --   require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
    --   and not require('luasnip').session.jump_active
    -- then
    --   require('luasnip').unlink_current()
    -- end
  end,
})
autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
-- 修改lua/plugins.lua 自动更新插件
autocmd("BufWritePost", {
   
    -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
    callback = function()
      if vim.fn.expand("<afile>") == "lua/plugin/list.lua" then
        vim.api.nvim_command("source lua/plugin/list.lua")
        vim.api.nvim_command("LazySync")
      end
    end,
  })
  