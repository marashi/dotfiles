vim.cmd([[
  highlight Visual gui=reverse
]])

local M = {}
M.ui = {
	theme = "nightowl",
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
	},
	nvdash = {
		load_on_startup = true,

		header = {
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
		},
	},
}
M.plugins = "custom.plugins"

return M
