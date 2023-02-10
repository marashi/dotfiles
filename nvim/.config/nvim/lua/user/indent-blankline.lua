local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.cmd([[highlight IndentBlanklineIndent guifg=#86abdc gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#dcc074 gui=nocombine]])

indent.setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = false,
	char_highlight_list = {
		"IndentBlanklineIndent",
	},
})
