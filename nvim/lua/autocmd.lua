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
    -- require("nvim-tree.api").tree.open()
   
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
autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
    -- Code action
    keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    -- Rename all occurrences of the hovered word for the entire file
    keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>")
    -- Rename all occurrences of the hovered word for the selected files
    keymap("n", "<leader>rr", "<cmd>Lspsaga rename ++project<CR>")
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
    -- Go to definition
    keymap("n","gdd", "<cmd>Lspsaga goto_definition<CR>")
    keymap("n","go", "<cmd>Lspsaga outline<CR>")
    keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
  
    -- Go to type definition
    keymap("n","gtt", "<cmd>Lspsaga goto_type_definition<CR>")
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
   
    keymap('n', 'gr',"<cmd>Telescope lsp_references<cr>", opts)
    keymap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", opts)

    keymap('n', '<leader>k', vim.lsp.buf.signature_help, opts)
    keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)


    -- keymap('n', '<space>ca', vim.lsp.buf.code_action, opts)
    keymap('n', '<space>f', function()

      vim.lsp.buf.format { async = true }
      
    end, opts)
  end,
})
