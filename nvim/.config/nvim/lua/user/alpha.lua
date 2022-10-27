local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[      .            .      ]],
	[[    .,;'           :,.    ]],
	[[  .,;;;,,.         ccc;.  ]],
	[[.;c::::,,,'        ccccc: ]],
	[[.::cc::,,,,,.      cccccc.]],
	[[.cccccc;;;;;;'     llllll.]],
	[[.cccccc.,;;;;;;.   llllll.]],
	[[.cccccc  ';;;;;;'  oooooo.]],
	[['lllllc   .;;;;;;;.oooooo']],
	[['lllllc     ,::::::looooo']],
	[['llllll      .:::::lloddd']],
	[[.looool       .;::coooodo.]],
	[[  .cool         'ccoooc.  ]],
	[[    .co          .:o:.    ]],
	[[      .           .'      ]],
	[[                          ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	-- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("d", "  Dot Files", ":e ~/dotfiles/ <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/dotfiles/nvim/.config/nvim/lua/user/_plugins.lua <CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "▌│█║▌║▌║ П Σ Ө V I M ║▌║▌║█│▌"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Question"
dashboard.section.header.opts.hl = "LineNr"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- [
-- \ '     ________ ;;     ________',
-- \ '    /********\;;;;  /********\',
-- \ '    \********/;;;;;;\********/',
-- \ '     |******|;;;;;;;;/*****/',
-- \ '     |******|;;;;;;/*****/''',
-- \ '    ;|******|;;;;/*****/'';',
-- \ '  ;;;|******|;;/*****/'';;;;;',
-- \ ';;;;;|******|/*****/'';;;;;;;;;',
-- \ '  ;;;|***********/'';;;;;;;;;',
-- \ '    ;|*********/'';;;;;;;;;',
-- \ '     |*******/'';;;;;;;;;',
-- \ '     |*****/'';;;;;;;;;',
-- \ '     |***/'';;;;;;;;;',
-- \ '     |*/''   ;;;;;;',
-- \ '              ;;',
-- \]
