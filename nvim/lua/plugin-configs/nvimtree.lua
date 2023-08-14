local present, nvimtree = pcall(require, "nvim-tree")

if present then
	
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
