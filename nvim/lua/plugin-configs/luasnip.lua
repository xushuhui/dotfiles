local present, ls = pcall(require, 'luasnip')

local types = require('luasnip.util.types')

if present then
	local options = {
		history = true,
		updateevents = 'TextChanged,TextChangedI',
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { ' « ', 'NonTest' } },
				},
			},
		},
	}

	ls.config.set_config(options)
  	require("luasnip.loaders.from_vscode").load()
	require('luasnip.loaders.from_vscode').lazy_load({ paths = "~/.config/nvim/snippets" })
end
