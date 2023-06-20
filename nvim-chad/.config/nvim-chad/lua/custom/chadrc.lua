local M = {}
M.ui = {
	theme = "nightowl",
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
	},
	cmp = {
		style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
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
M.mappings = require("custom.mappings")

return M
