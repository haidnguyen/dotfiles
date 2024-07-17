local wk = require('which-key')

wk.setup({
  -- window = {
  --   border = 'double',
  --   position = 'bottom',
  --   padding = { 1, 0.12, 1, 0.12 }
  -- },
  preset = "modern",
  triggers = { '<leader>', 'g' }
})

wk.add({
  { "<leader>c", group = "Chore" },
  { "<leader>f", group = "File" },
  { "<leader>t", group = "Tab & Tree" },
  { "<leader>s", group = "Slit Window" }
})
