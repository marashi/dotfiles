local status_ok, configs = pcall(require, "nvim-treesitter.configs")
 if not status_ok then
   return
 end

 configs.setup {
   ensure_installed = {
    "bash",
    "comment",
    "css",
    "diff",
    "dockerfile",
    "gitignore",
    "go",
    "graphql",
    "html",
    "http",
    "javascript",
    "json",
    "jsdoc",
    "lua",
    "markdown",
    "python",
    "rust",
    "scss",
    "solidity",
    "tsx",
    "typescript",
    "yaml"
   }, -- one of "all", or a list of languages
   sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
   ignore_install = { "" }, -- List of parsers to ignore installing
   highlight = {
     enable = true, -- false will disable the whole extension
     disable = { "" }, -- list of language that will be disabled
     additional_vim_regex_highlighting = true,
   },
   autopairs = {
		enable = true,
	},
   indent = { enable = true, disable = { "yaml" } },
   context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
 }
