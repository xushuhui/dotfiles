local present, cmp = pcall(require, "cmp")
local lspkind_icons = {
	Text = '  ',
	Method = '  ',
	Function = '  ',
	Constructor = '  ',
	Field = '  ',
	Variable = '  ',
	Class = '  ',
	Interface = '  ',
	Module = '  ',
	Property = '  ',
	Unit = '  ',
	Value = '  ',
	Enum = '  ',
	Keyword = '  ',
	Snippet = '  ',
	Color = '  ',
	File = '  ',
	Reference = '  ',
	Folder = '  ',
	EnumMember = '  ',
	Constant = '  ',
	Struct = '  ',
	Event = '  ',
	Operator = '  ',
	TypeParameter = '  ',
}
if present then
	local cmp_window = require("cmp.utils.window")

	cmp_window.info_ = cmp_window.info
	cmp_window.info = function(self)
		local info = self:info_()
		info.scrollable = false
		return info
	end
	cmp.setup({
		completion = {
			completeopt = "menu,menuone",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		mapping = ({
			["<Up>"] = cmp.mapping({
				i = cmp.mapping.select_prev_item(),
				c = cmp.mapping.select_prev_item(),
			}),
			["<Down>"] = cmp.mapping({
				i = cmp.mapping.select_next_item(),
				c = cmp.mapping.select_next_item(),
			}),

			["<C-c>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping({
				i = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

			}),
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
				vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind],
					vim_item.kind:lower())

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
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "path" },
			{ name = "rg" },
			{ name = "friendly-snippets" },
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

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ ":"}, {

		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({ { name = "path" } ,{ name = "buffer" },  { name = "cmdline" } }),
	})
end

_ = vim.cmd([[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
  augroup END
]])
