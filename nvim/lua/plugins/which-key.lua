return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")

			wk.setup({
				preset = "modern",
				triggers = { "<leader>", "g" },
			})

			wk.add({
				{ "<leader>c", group = "Chore" },
				{ "<leader>f", group = "File" },
				{ "<leader>t", group = "Tab & Tree" },
				{ "<leader>s", group = "Slit Window" },
			})
		end,
	},
}
