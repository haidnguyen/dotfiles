return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
				},
			})

			telescope.load_extension("fzf")

			vim.keymap.set(
				"n",
				"<leader>ff",
				"<cmd>Telescope find_files<CR>",
				{ noremap = true, silent = true, desc = "Find File" }
			)
			vim.keymap.set(
				"n",
				"<leader>fg",
				"<cmd>Telescope live_grep<CR>",
				{ noremap = true, silent = true, desc = "Find Grep" }
			)
			vim.keymap.set(
				"n",
				"<leader>fb",
				"<cmd>Telescope buffers<CR>",
				{ noremap = true, silent = true, desc = "Find Buffer" }
			)
			vim.keymap.set(
				"n",
				"<leader>fh",
				"<cmd>Telescope help_tags<CR>",
				{ noremap = true, silent = true, desc = "Help" }
			)
			vim.keymap.set(
				"n",
				"<leader>fs",
				"<cmd>Telescope lsp_document_symbols<CR>",
				{ noremap = true, silent = true, desc = "Find Symbol" }
			)
		end,
	},
}
