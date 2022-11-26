local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local normal_opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local normal_mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	b = {
		name = "Buffers",
		a = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"All Buffers",
		},
		c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
		["1"] = { "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", "Go to Buffer 1" },
		["2"] = { "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", "Go to Buffer 2" },
		["3"] = { "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", "Go to Buffer 3" },
		["4"] = { "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", "Go to Buffer 4" },
		["5"] = { "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", "Go to Buffer 5" },
		["6"] = { "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", "Go to Buffer 6" },
		["7"] = { "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", "Go to Buffer 7" },
		["8"] = { "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", "Go to Buffer 8" },
		["9"] = { "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", "Go to Buffer 9" },
		["$"] = { "<cmd>lua require('bufferline').go_to_buffer(-1, true)<cr>", "Go to last Buffer" },
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, hidden = true})<cr>",
		"Find Files",
	},
	["r"] = {
		"<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy{hidden = true})<cr>",
		"Find Refs",
	},
	["t"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	-- ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	["Y"] = { 'gg"+yG<CR>', "Copy File" },
	["n"] = { '<cmd>let @+=expand("%:p")<CR>', "Copy Filename" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		d = { "<cmd>DiffviewOpen<CR>", "Open Diff" },
		x = { "<cmd>DiffviewClose<CR>", "Close Diff" },
		l = { "<cmd>DiffviewFileHistory<CR>", "Current Branch History" },
		h = { "<cmd>DiffviewFileHistory %<CR>", "Current File History" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		w = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		-- d = {
		--   "<cmd>Gitsigns diffthis HEAD<cr>",
		--   "Diff",
		-- },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		t = { "<cmd>TroubleToggle<cr>", "Trouble" },
		d = {
			"<cmd>TroubleToggle document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>Mason<cr>", "Installer Info" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},
}

which_key.setup(setup)
which_key.register(normal_mappings, normal_opts)

local visual_opts = {
	mode = "x", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local visual_mappings = {
	g = {
		name = "Git",
		h = { ":DiffviewFileHistory<CR>", "Current Branch History" },
	},
}

which_key.register(visual_mappings, visual_opts)
