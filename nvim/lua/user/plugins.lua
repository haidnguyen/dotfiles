local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- Colorscheme
	{ 'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },

	{ 'nvim-lua/plenary.nvim' },

	-- null-ls
	{
		'jose-elias-alvarez/null-ls.nvim',
	},

	-- file tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		}

	},

	-- Highlight, edit, and navigate code
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},



	-- Telescope
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', },

	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}

	}
})


local lsp = require('lsp-zero').preset('recommended')
local util = require('lspconfig.util')


lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set('n', 'fmt', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
end)

lsp.ensure_installed({
	'tsserver',
	'angularls',
	'eslint'
})
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').angularls.setup({
	root_dir = util.root_pattern('angular.json', 'project.json', 'nx.json')
})



lsp.setup()
