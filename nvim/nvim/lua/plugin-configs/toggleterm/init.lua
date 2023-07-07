
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
    lazygit:toggle()
  end
keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
keymap("n","<leader>t",":ToggleTerm <CR>")
bufmap(0,'t', '<esc>', [[<C-\><C-n>]])
bufmap(0,'t', 'jk', [[<C-\><C-n>]])
bufmap(0,'t', '<C-h>', [[<Cmd>wincmd h<CR>]])
bufmap(0,'t', '<C-j>', [[<Cmd>wincmd j<CR>]])
bufmap(0,'t', '<C-k>', [[<Cmd>wincmd k<CR>]])
bufmap(0,'t', '<C-l>', [[<Cmd>wincmd l<CR>]])
bufmap(0,'t', '<C-w>', [[<C-\><C-n><C-w>]])
require("toggleterm").setup({
    direction = 'vertical',
    size=50,
})
