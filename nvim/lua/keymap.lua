-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- 键位定义函数
-- @param mode 模式
-- @param key 键位
-- @param command 命令
-- @param opt 其他参数

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts_remap = {
	noremap = true,
	silent = true,
}

local M = {}

M.general = {
	{ "<C-s>",   "<cmd> w <CR>",              "n", desc = "Save file" },
	{ "<bs>",    "caw",                       "n" },
	{ ";",       ":",                         "n" },
	-- -- save && quit
	{ "w",       ":w<CR>",                    "n" },
	{ "q",       ":qa!<CR>",                  "n" },
	{ "wa",      ":wa<CR>",                   "n" },
	{ "wq",      ":wqa<CR>",                  "n" },

	-- -- 上下滚动浏览
	{ "<C-j>",   "5j",                        "n" },
	{ "<C-k>",   "5k",                        "n" },
	{ "<C-d>",   "10j",                       "n" },
	{ "<C-u>",   "10k",                       "n" },
	{ "<TAB>",   ":bnext <CR>",               "n" },
	{ "<S-TAB>", ":bprevious <CR>",           "n" },
	{ "<S-x>",   ":bdelete <CR> :bnext <CR>", "n" },

	-- -- visual模式下缩进代码
	-- keymap("v", "<", "<gv"),
	-- keymap("v", ">", ">gv"),


	-- 在visual mode 里粘贴不要复制
	-- keymap("x", "p", '"_dP'),
	-- keymap("i", "<C-a>", "<}>"),
	-- keymap("i", "<C-e>", "<ESC>^i"),


}
M.toggleterm = {

	{ "<leader>t", ":ToggleTerm <CR>" },
	{ '<Esc>',     "<C-\\><C-n>",        't' },

	{ '<C-h>',     "<Cmd>wincmd h<CR>", 't' },
	{ '<C-j>',     "<Cmd>wincmd j<CR>", 't' },
	{ '<C-k>',     "<Cmd>wincmd k<CR>", 't' },
	{ '<C-l>',     "<Cmd>wincmd l<CR>", 't' },
	-- { '<C-w>',     '<C-\><C-n><C-w>',   't' }
}
M.dap = {
	{ "<F1>", "<cmd>lua require'dap'.continue()<CR>",          { "i", "n", "v" } },
	{ "<F2>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { "i", "n", "v" } },
	{ "<F3>", "<cmd>lua require'dap'.step_over()<CR>",         { "i", "n", "v" } },
	{ "<F3>", "<cmd>lua require'dap'.step_into()<CR>",         { "i", "n", "v" } },
	{ "<F4>", "<cmd>lua require'dap'.step_out()<CR>",          { "i", "n", "v" } },
	{ "<F5>", "<cmd>lua require'dap'.terminate()<CR>",          { "i", "n", "v" } },
	
}
M.lsp = {

	-- 	map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
	-- map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
	-- map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
	-- map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
	-- map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
	-- map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
	-- map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
	-- map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
	-- map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

	{ 'gD',        vim.lsp.buf.declaration },
	{ 'gd',        vim.lsp.buf.definition },
	{ "gs",        "<cmd>Lspsaga show_line_diagnostics<cr>", },
	{ 'K',         "<cmd>Lspsaga hover_doc<cr>" },
	{ 'gi',        vim.lsp.buf.implementation },
	{ '<C-k>',     vim.lsp.buf.signature_help },
	{ '<space>wa', vim.lsp.buf.add_workspace_folder },
	{ '<space>wr', vim.lsp.buf.remove_workspace_folder },

	{ '<space>D',  vim.lsp.buf.type_definition },
	{ 'rn',        vim.lsp.buf.rename },
	{ "gx",        "<cmd>Lspsaga code_action<cr>",           { 'n', 'v' } },
	{ 'gr',        vim.lsp.buf.references },
}
M.nvimtree = {
	{ "<C-n>", "<cmd>NvimTreeFocus <CR>", desc = "NvimTreeFocus" }
}

M.telescope = {
	{ "<C-p>", ":Telescope find_files <CR>" },
	{ "<C-f>", ":Telescope live_grep <CR>" },
}
M.test = {
	{ "tn", ":TestNearest <CR>" },
	{ "tl", ":TestLast <CR>" },
	{ "tv", ":TestVisit <CR>" },
}

M.comment = {
	{ "<leader>/", ':lua require("Comment.api").toggle_current_linewise()<CR>' },
	---keymap("v", "<leader>/", ':lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>'},
}



M.gitsigns = {
	-- Navigation
	--   { "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
	--   { "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

	--   -- Actions
	--   { "<leader>hs", ":Gitsigns stage_hunk<CR>")
	--   keymap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
	--   { "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")

	--   { "<leader>hr", ":Gitsigns reset_hunk<CR>")
	--   keymap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
	--   { "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")

	--   { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
	--   { "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
	--   { "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
	--   { "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
	--   { "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
	--   { "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
	--   { "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

	--   -- Text object
	--   keymap("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
	--   keymap("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
	-- }


	-- M.dap = {
	--   keymap({ "i", "n", "v" }, "<F1>", "<cmd>lua require'dap'.continue()<CR>")
	--   keymap({ "i", "n", "v" }, "<F2>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")

	--   keymap({ "i", "n", "v" }, "<F3>", "<cmd>lua require'dap'.step_over()<CR>")
	--   keymap({ "i", "n", "v" }, "<F4>", "<cmd>lua require'dap'.step_into()<CR>")
	--   keymap({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.step_out()<CR>")
}

M.hop = {
	-- keymap(
	--   "n",
	--   "f",
	--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
	-- )
	-- keymap(
	--   "n",
	--   "F",
	--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
	-- )
	-- keymap(
	--   "n",
	--   "t",
	--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
	-- )
	-- keymap(
	--   "n",
	--   "T",
	--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
	-- )
}

M.harpoon = {
	-- { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>")
	-- { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
	-- { "<C-f>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
	-- { "<C-p>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
	-- { "<C-y>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
	-- { "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")
}

return M
