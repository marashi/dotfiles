local M = {}

local ignore_patterns = {
	"%.spec.*",
	"%.lock$",
	"%-lock.json",
}

function M.find_files()
	local opts = {
		previewer = false,
		hidden = true,
		layout_config = { width = 0.70 },
		path_display = { "truncate" },
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_dropdown(opts))
end

function M.find_filtered_refs()
	local opts = {
		hidden = true,
		file_ignore_patterns = ignore_patterns,
		prompt_title = "Find Filtered Refs",
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.grep_string(themes.get_ivy(opts))
end

function M.find_all_refs()
	local opts = {
		hidden = true,
		prompt_title = "Find All Refs",
		layout_config = { height = 0.70 },
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.grep_string(themes.get_ivy(opts))
end

function M.find_filtered_text()
	local opts = {
		file_ignore_patterns = ignore_patterns,
		prompt_title = "Find Filtered Text ",
		layout_config = { height = 0.70 },
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.live_grep(themes.get_ivy(opts))
end

function M.find_all_text()
	local opts = {
		additional_args = function()
			return { "--hidden" }
		end,
		prompt_title = "Find All Text",
		layout_config = { height = 0.70 },
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.live_grep(themes.get_ivy(opts))
end

function M.list_buffers()
	local opts = {
		previewer = false,
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.buffers(themes.get_dropdown(opts))
end

function M.find_current_buffer()
	local opts = {
		layout_config = { height = 0.70 },
	}
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.current_buffer_fuzzy_find(themes.get_ivy(opts))
end

function M.find_current_symbols()
	local opts = {
		layout_config = { width = 0.70, preview_width = 0.70 },
	}
	local builtin = require("telescope.builtin")
	builtin.lsp_document_symbols(opts)
end

return M
