-- Delay execution of highlight command until after plugins are loaded
vim.defer_fn(function()
	vim.cmd([[
    highlight Visual gui=reverse
  ]])
end, 0)
