
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_window = require("cmp.utils.window")

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
	local info = self:info_()
	info.scrollable = false
	return info
end
local select_opts = { behavior = cmp.SelectBehavior.Select }
local luasnip = require("luasnip")

cmp.setup({
	completion = {
		completeopt = "menu,menuone",
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	mapping = ({
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		["<CR>"] = cmp.mapping.confirm { select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- ["<C-y>"] = cmp.mapping.complete(),
		-- ["<C-y>"] = cmp.mapping(
		-- 	cmp.mapping.confirm({
		-- 		behavior = cmp.ConfirmBehavior.Insert,
		-- 		select = true,
		-- 	}),
		-- 	{ "i", "c" }
		-- ),
		-- ["<CR>"] =cmp.mapping.complete(),
	}),
	formatting = {
		format = function(entry, vim_item)

			vim_item.menu = ({
				buffer = "[Buf]",
				nvim_lsp = "[Lsp]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				luasnip = "[Snip]",
			})[entry.source.name]
			
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
		
		{
			name = 'spell',
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
	},

})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
	view = {
		entries = { name = 'wildmenu', separator = '|' }
	},
})
cmp.setup.cmdline({ ":" }, {

	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" }, { name = "buffer" }, { name = "cmdline" } }),
})


_ = vim.cmd([[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
  augroup END
]])
