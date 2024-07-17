return {
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			local saga = require("lspsaga")

			saga.setup({
				scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },

				definition = {
					edit = "<CR>",
				},

				ui = {
					colors = {
						normal_bg = "#022746",
					},
				},
			})
		end,
	},
}
