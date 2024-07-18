return {
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup({})
			require("telescope").load_extension("scope")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					-- 	mode = "tabs",
					-- 	diagnostics = "nvim_lsp",
					highlights = require("catppuccin.groups.integrations.bufferline").get(),
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
				},
			})
			vim.keymap.set(
				"n",
				"<leader>tn",
				"<cmd>BufferLineCycleNext<CR>",
				{ noremap = true, silent = true, desc = "Next" }
			)

			vim.keymap.set(
				"n",
				"<leader>tp",
				"<cmd>BufferLineCyclePrev<CR>",
				{ noremap = true, silent = true, desc = "Prev" }
			)

			vim.keymap.set(
				"n",
				"<leader>ts",
				"<cmd>BufferLineSortByDirectory<CR>",
				{ noremap = true, silent = true, desc = "Sort" }
			)

			vim.keymap.set(
				"n",
				"<leader>tt",
				"<cmd>BufferLinePick<CR>",
				{ noremap = true, silent = true, desc = "Pick" }
			)

			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>BufferLineCloseOthers<CR>",
				{ noremap = true, silent = true, desc = "Close Others" }
			)

			vim.keymap.set("n", "<leader>tx", ":bp|bd#<CR>", { noremap = true, silent = true, desc = "Close" })
		end,
	},
}
