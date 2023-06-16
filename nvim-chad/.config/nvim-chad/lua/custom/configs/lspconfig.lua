local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "cssls", "html", "tsserver", "jsonls", "angularls", "dockerls", "rust_analyzer", "eslint" }

for _, lsp in ipairs(servers) do
	if lsp == "angularls" then
		local util = require("lspconfig.util")
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = util.root_pattern("angular.json", "project.json"), -- libs do not have angular.json
		})
	else
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end
