local lsp = require('lsp-zero').preset('recommended')
local util = require('lspconfig.util')
local keymap = vim.keymap.set

lsp.on_attach(function(_, bufnr)
  local function get_opts(desc)
    return {
      noremap = true,
      silent = true,
      buffer = bufnr,
      desc = desc
    }
  end

  keymap('n', 'gf', "<cmd>Lspsaga lsp_finder<CR>", get_opts('LSP Finder'))
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", get_opts('Go to definition'))
  keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", get_opts('Peek definition'))
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", get_opts('Go to implementation'))
  keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", get_opts('Code Action'))
  keymap("n", "<leader>cn", "<cmd>Lspsaga rename<CR>", get_opts('Rename'))
  keymap("n", "<leader>cD", "<cmd>Lspsaga show_line_diagnostics<CR>", get_opts('Show line diagnostics'))
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", get_opts('Show cursor diagnostics'))
  keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", get_opts('Jump prev diagnostic'))
  keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", get_opts('Jump next diagnostic'))
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", get_opts('Show hover doc'))
  -- keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'tsserver',
  'angularls',
  'html'
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').angularls.setup({
  root_dir = util.root_pattern('angular.json', 'project.json', 'nx.json')
})
require('lspconfig').html.setup({
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
})


lsp.setup()
