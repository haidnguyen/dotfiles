local wk = require('which-key')

wk.setup({
  window = {
    border = 'double',
    position = 'bottom',
    winblend = 50
  },
  triggers = { '<leader>', 'g' }
})

wk.register({
  f = {
    name = 'File',
  },
  s = {
    name = 'Split Window'
  },
  t = {
    name = 'Tab & Tree',
  },
  c = {
    name = 'Chore'
  },

}, { prefix = '<leader>' })
