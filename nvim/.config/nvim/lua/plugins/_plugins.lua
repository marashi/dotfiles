local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
-- Install your plugins here
require("lazy").setup({
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"moll/vim-bbye",
	"folke/which-key.nvim",
	"windwp/nvim-autopairs",
	"tpope/vim-surround",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"BurntSushi/ripgrep", -- needed for telescope
	"tpope/vim-unimpaired",

	-- UI / Colorschemes
	"EdenEast/nightfox.nvim",
	"goolord/alpha-nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"norcalli/nvim-colorizer.lua",
	"lukas-reineke/indent-blankline.nvim",

	-- File browser
	"nvim-tree/nvim-tree.lua",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"RRethy/vim-illuminate",
	"folke/trouble.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-context",

	-- Git
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",
	"tpope/vim-fugitive",

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},
})
