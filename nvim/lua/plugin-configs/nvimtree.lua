local present, nvimtree = pcall(require, "nvim-tree")

if present then
	-- 新建当前文件并打开
	-- 相对路径
	require("nvim-tree.events").on_file_created(function(file)
		vim.cmd("edit " .. file.fname)
	end)
	-- 绝对路径
	require("nvim-tree.events").on_file_created(function(file)
		vim.cmd("edit " .. vim.fn.fnamemodify(file.fname, ":p"))
	end)


	nvimtree.setup({
		disable_netrw = true,
		hijack_netrw = true,
		open_on_tab = true,
		hijack_cursor = false,
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		view = {
			width = 30,
			hide_root_folder = false,
			side = "left",
			adaptive_size = true,
			number = false,
			relativenumber = false,
			mappings = {
				custom_only = false,
				list = {
					{ key = { "sv" }, action = "vsplit" }, --分屏
					{ key = { "sh" }, action = "split" }, --分屏
					{ key = { "I" },  action = "toggle_file_info" },
					{ key = { "t" },  action = "tabnew" },
					{ key = { "[" },  action = "dir_up" },
					{ key = { "]" },  action = "cd" },

					-- refresh = "R",
					-- tabnew = "t",
				},
			},
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = false,
			},
		},
		filters = {
			dotfiles = false,
			custom = { "^.git$" },
			exclude = { "node_modules" },
		},
		renderer = {
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				webdev_colors = true,
				git_placement = "before",
				padding = " ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = true,
					git = true,
					folder_arrow = false,
				},
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						deleted = "",
						untracked = "u",
						ignored = "◌",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
				},
			},
		},
	})
end
