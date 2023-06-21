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
  { 'nvim-lua/plenary.nvim' },
  { "nvim-tree/nvim-web-devicons" },

  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
  },
  { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },

  -- Comment
  { 'numToStr/Comment.nvim' },


  -- Tree view
  { 'nvim-tree/nvim-tree.lua',  version = '*' },

  -- Lualine
  { 'nvim-lualine/lualine.nvim' },

  -- treesiter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Telescope
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim',            branch = '0.1.x' },

  -- null-ls
  { 'jose-elias-alvarez/null-ls.nvim' },
  { "jay-babu/mason-null-ls.nvim" },

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
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'ray-x/lsp_signature.nvim' }
    },

  },

  -- lspsaga
  { "glepnir/lspsaga.nvim",      event = "LspAttach" },

  -- autopairs
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag',    after = 'nvim-treesitter' },

  -- Git
  { 'lewis6991/gitsigns.nvim' },

  -- Tabline
  { 'akinsho/bufferline.nvim',   version = "*",            after = 'catppuccin' },

  -- Terminal
  { 'akinsho/toggleterm.nvim',   version = "*",            config = true },


  -- Git
  { 'akinsho/git-conflict.nvim', version = "*",            config = true },

  -- quicklist
  { 'yorickpeterse/nvim-pqf' },

  -- scrollbar
  { 'petertriho/nvim-scrollbar' },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }
})
