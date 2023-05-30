local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

null_ls.setup({
  sources = {
    formatting.prettier,
    diagnostics.eslint
  },
})
