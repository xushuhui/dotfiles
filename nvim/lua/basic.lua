keys = require('keymap')
for i, v in ipairs(keys.general) do
	keymap(v[1], v[2], v[3],v[4])
end
vim.opt.clipboard = "unnamedplus"
