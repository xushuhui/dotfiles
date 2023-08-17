require('mini.pairs').setup()
require('mini.fuzzy').setup()

require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.cursorword').setup()
-- require('mini.indentscope').setup()
require('mini.move').setup()
require('mini.comment').setup()
require('mini.sessions').setup({
	autoread = true,
	file = 'Session.vim',
})
require('mini.pairs').setup()
require('mini.fuzzy').setup()
require('mini.hipatterns').setup({
	highlighters = {
		todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
	},
})
require('mini.trailspace').setup()
require('mini.basics').setup({
	mappings = {
		windows = true,
		move_with_alt = true,
	},
})
require('mini.files').setup()
--  require('mini.completion').setup({
-- 	  lsp_completion = {
-- 		source_func = 'omnifunc',
-- 	  },
--  })-- 
