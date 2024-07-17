return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true

			vim.keymap.set("n", "<leader>te", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle" })
			vim.keymap.set(
				"n",
				"<leader>tf",
				":NvimTreeFindFile<CR>",
				{ noremap = true, silent = true, desc = "Focus File" }
			)
			vim.keymap.set(
				"n",
				"<leader>tc",
				":NvimTreeCollapse<CR>",
				{ noremap = true, silent = true, desc = "Collapse" }
			)

			require("nvim-tree").setup()
		end,
	},
}
