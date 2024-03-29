local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {
		adaptive_size = true,
		side = "left",
		width = 40,
		signcolumn = "yes",
	},
	git = {
		enable = false,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
		group_empty = true,
		root_folder_label = false,
		highlight_git = false,
		highlight_opened_files = "none",

		indent_markers = {
			enable = false,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},

			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
})

-- local api_status_ok, nvim_tree_api = pcall(require, "nvim-tree.api")
-- if not api_status_ok then
-- 	return
-- end
--
-- local function open_nvim_tree(data)
-- 	local IGNORED_FT = {
-- 		"alpha",
-- 	}
--
-- 	local filetype = vim.bo[data.buf].ft
--
-- 	if vim.tbl_contains(IGNORED_FT, filetype) then
-- 		return
-- 	end
--
-- 	-- open the tree but don't focus it
-- 	nvim_tree_api.tree.toggle({ focus = false })
-- end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
