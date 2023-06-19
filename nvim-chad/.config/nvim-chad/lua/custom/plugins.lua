local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				-- "vue", "svelte",

				-- low level
				"rust",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"css-lsp",
				"eslint-lsp",
				"json-lsp",
				"rust-analyzer",
				"typescript-language-server",
				"angular-language-server",
				"prettier",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		event = { "InsertEnter" },
		cmd = { "Copilot" },
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<A-\\>",
					next = "<A-]>",
					prev = "<A-[>",
					dismiss = "<C-]>",
				},
			},
		},
	},
	{
		"ggandor/leap.nvim",
		keys = {
			{ "S", "<Plug>(leap-backward-to)", mode = "n" },
			{ "s", "<Plug>(leap-forward-to)", mode = "n" },
			{ "gs", "<Plug>(leap-from-window)", mode = "n" },
		},
	},
}

return plugins
