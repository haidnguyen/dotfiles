local lsp = require('lsp-zero').preset('recommended')
local util = require('lspconfig.util')
local keymap = vim.keymap.set


lsp.on_attach(function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap('n', 'gf', "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'tsserver',
  'angularls',
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').angularls.setup({
  root_dir = util.root_pattern('angular.json', 'project.json', 'nx.json')
})

lsp.setup()
