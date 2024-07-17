local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },

	-- Colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Comment
	{ "numToStr/Comment.nvim" },

	-- Tree view
	{ "nvim-tree/nvim-tree.lua", version = "*" },

	-- Lualine
	{ "nvim-lualine/lualine.nvim" },

	-- treesiter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	-- Telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				dependencies = {
					"WhoIsSethDaniel/mason-tool-installer.nvim",
				},
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
			}, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "ray-x/lsp_signature.nvim" },
		},
	},

	-- lspsaga
	{ "glepnir/lspsaga.nvim", event = "LspAttach" },

	-- autopairs
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	-- Tabline
	{ "akinsho/bufferline.nvim", version = "*", after = "catppuccin" },

	-- Terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- quicklist
	{ "yorickpeterse/nvim-pqf" },

	-- scrollbar
	{ "petertriho/nvim-scrollbar" },

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	-- typescript
	{ "jose-elias-alvarez/typescript.nvim" },

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-- Lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- schema store
	{ "b0o/schemastore.nvim" },

	-- session
	{
		"rmagatti/auto-session",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
		},
	},
})
