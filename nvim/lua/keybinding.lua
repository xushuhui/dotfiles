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
M.nvimtree = function()
  keymap("n", "<leader>e", ":NvimTreeToggle <CR>")
end

M.telescope = function()
  keymap("n", "<C-p>", ":Telescope find_files <CR>")
  keymap("n", "<C-f>", ":Telescope live_grep <CR>")
end
M.bufferline = function()
  keymap("n", "<TAB>", ":BufferLineCycleNext <CR>")
  keymap("n", "<S-TAB>", ":BufferLineCyclePrev <CR>")
end

M.comment = function()
  keymap("n", "<leader>/", ':lua require("Comment.api").toggle_current_linewise()<CR>')
  keymap("v", "<leader>/", ':lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
end

M.init = function()
  keymap("i", "<C-c>", "<Esc>")
  -- 命令行下 Ctrl+j/k  上一个下一个
  keymap("c", "<C-j>", "<C-n>", opts_remap)
  keymap("c", "<C-k>", "<C-p>", opts_remap)

  keymap({ "n", "v" }, "<bs>", "caw")

  -- -- save && quit
  keymap("n", "w", ":w<CR>")
  keymap("n", "wq", ":wq<CR>")
  keymap("n", "wa", ":wa<CR>")
  keymap("n", "wq", ":wqa<CR>")
  keymap("n", "q", ":qa!<CR>")

  -- -- 上下滚动浏览
  keymap({ "n", "v" }, "<C-j>", "5j")
  keymap({ "n", "v" }, "<C-k>", "5k")
  keymap({ "n", "v" }, "<C-d>", "10j")
  keymap({ "n", "v" }, "<C-u>", "10k")

  keymap({ "n", "v" }, "/", "/\\v", { remap = false, silent = false })

  -- -- fix :set wrap
  -- keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", opts_expr)
  -- keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", opts_expr)

  -- -- visual模式下缩进代码
  keymap("v", "<", "<gv")
  keymap("v", ">", ">gv")

  -- -- 上下移动选中文本
  -- keymap("x", "J", ":move '>+1<CR>gv-gv")
  -- keymap("x", "K", ":move '<-2<CR>gv-gv")

  -- 在visual mode 里粘贴不要复制
  keymap("x", "p", '"_dP')

  keymap("i", "<C-a>", "<End>")
  keymap("i", "<C-e>", "<ESC>^i")

  keymap("n", "<C-h>", "<C-w>h")
  keymap("n", "<C-l>", "<C-w>l")

  keymap("n", "<C-d>", "<C-d>zz")
  keymap("n", "<C-u>", "<C-u>zz")

  keymap("n", "<A-Up>", ":resize +2<CR>")
  keymap("n", "<A-Down>", ":resize -2<CR>")
  keymap("n", "<A-Left>", ":vertical resize -2<CR>")
  keymap("n", "<A-Right>", ":vertical resize +2<CR>")


  keymap("n", '<S-h>', "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  keymap("n", '<S-l>', "<cmd>bnext<cr>", { desc = "Next buffer" })

  keymap("n", "<space><cr>", "<cmd>noh<CR>")


  -- keymap('v', '<A-j>', ':m .+1<CR>==')
  -- keymap('v', '<A-k>', ':m .-2<CR>==')
end



M.gitsigns = function()
  -- Navigation
  keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
  keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

  -- Actions
  keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
  keymap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
  keymap("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")

  keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
  keymap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
  keymap("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")

  keymap("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
  keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
  keymap("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
  keymap("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
  keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
  keymap("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
  keymap("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

  -- Text object
  keymap("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
  keymap("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

M.todo_comments = function()
  keymap("n", "<leader>tl", ":TodoLocList<CR>")
  keymap("n", "<leader>ts", ":TodoTelescope<CR>")
end


M.dap = function()
  keymap({ "i", "n", "v" }, "<F1>", "<cmd>lua require'dap'.continue()<CR>")
  keymap({ "i", "n", "v" }, "<F2>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")

  keymap({ "i", "n", "v" }, "<F3>", "<cmd>lua require'dap'.step_over()<CR>")
  keymap({ "i", "n", "v" }, "<F4>", "<cmd>lua require'dap'.step_into()<CR>")
  keymap({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.step_out()<CR>")
end
M.markdown_preview = function()
  keymap("n", "<leader>mp", ":MarkdownPreview <CR>")
  keymap("n", "<leader>ms", ":MarkdownPreviewStop <CR>")
end

M.hop = function()
  keymap(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  )
  keymap(
    "n",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  )
  keymap(
    "n",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
  )
  keymap(
    "n",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
  )
end

M.harpoon = function()
  keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>")
  keymap("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
  keymap("n", "<C-f>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
  keymap("n", "<C-p>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
  keymap("n", "<C-y>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
  keymap("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")
end

return M
