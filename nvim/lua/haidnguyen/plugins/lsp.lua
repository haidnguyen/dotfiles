local lsp = require('lsp-zero').preset('recommended')
local util = require('lspconfig.util')


lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
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
