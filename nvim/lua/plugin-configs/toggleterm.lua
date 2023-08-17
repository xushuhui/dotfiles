local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
	lazygit:toggle()
end

keymap("<leader>g", "<cmd>lua _lazygit_toggle()<CR>", 'n', { noremap = true, silent = true })
require("toggleterm").setup({
	direction = 'vertical',
	start_in_insert = true,
	size = 60,
})
