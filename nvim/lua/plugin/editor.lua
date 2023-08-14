return {

	-- 目录树
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { 'NvimTreeToggle', 'NvimTreeFocus','NvimTreeFindFile' },
		config = function()
			require('plugin-configs.nvimtree')
		end,
		keys = require("keymap").nvimtree
	},
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require('plugin-configs.auto_save')
		end,
	},

	-- 模糊搜索
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		config = function()
			require('plugin-configs.telescope')
		end,
		keys = require("keymap").telescope
	},
	{ 'nvim-telescope/telescope-ui-select.nvim' },
	{'nvim-telescope/telescope-dap.nvim'},
	{
		'akinsho/toggleterm.nvim', version = "*",
		 config = function()
			require('plugin-configs.toggleterm')
		end,
		keys = require("keymap").toggleterm
	},

	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		event = 'BufRead',
	},
	{
		'nvim-treesitter/nvim-treesitter',
		event = 'CursorHold',
		build = ':TSUpdate',
		config = function()
			require('plugin-configs.treesitter')
		end,
	},
	{
		"romgrk/nvim-treesitter-context",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = {
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},

}
