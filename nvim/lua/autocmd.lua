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
autocmd('TextChanged', {
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

--autocmd('BufEnter', {
	-- pattern = '*',
	-- command = 'set fo-=c fo-=r fo-=o',
--})
-- 保存时自动格式化
autocmd("BufWritePre", {
	pattern = saveable_type,
	callback = function()
		vim.lsp.buf.format()
	end,
})
autocmd({"QuitPre"}, {
    callback = function() 
		vim.cmd("NvimTreeClose") 
	end,
})
--
autocmd('InsertLeave', {
	
	callback = function()
		
	end,
})
autocmd("BufReadPost", {
	callback = function()
		
	end,

})
local function open_nvim_tree(data)

	-- buffer is a directory
	-- require("nvim-tree.api").tree.focus()
	require("nvim-tree.api").tree.toggle({ focus = false })
	
end
autocmd("VimEnter", {
	callback = open_nvim_tree,
})

autocmd("BufWritePost", {
	callback = function()
		
	end,
})
autocmd('LspAttach', {
	-- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		
		-- keymap("gd", vim.lsp.buf.definition,'n',opts)
		-- bufmap(ev.buf,'n',"gd", vim.lsp.buf.definition)
		keys = require('keymap')
		for i, v in ipairs(keys.lsp) do
			bufmap(ev.buf,v[1], v[2], v[3])
		end
	end,
})
