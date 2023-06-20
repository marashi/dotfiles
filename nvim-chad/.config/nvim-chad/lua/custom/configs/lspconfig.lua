local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "cssls", "html", "tsserver", "jsonls", "angularls", "dockerls", "rust_analyzer", "eslint" }

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

for _, lsp in ipairs(servers) do
	if lsp == "angularls" then
		local util = require("lspconfig.util")
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = util.root_pattern("angular.json", "project.json"), -- libs do not have angular.json
		})
	elseif lsp == "tsserver" then
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
		})
	else
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end
