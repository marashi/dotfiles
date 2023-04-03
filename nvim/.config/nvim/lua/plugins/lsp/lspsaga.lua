local lspsaga_status_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status_ok then
	print("lspsaga_status_ok didnt work!")
	return
end

lspsaga.setup({
	symbol_in_winbar = {
		separator = "  ",
	},
})
