local wk = require('which-key')

wk.setup({
  window = {
    border = 'double',
    position = 'bottom',
    margin = { 1, 0.12, 1, 0.12 }
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
