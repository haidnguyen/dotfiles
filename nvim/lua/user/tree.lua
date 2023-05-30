require('nvim-tree').setup({})

vim.keymap.set('n', '<leader>tb', ':NvimTreeFocus<CR>', { noremap = true })
vim.keymap.set('n', '<leader>te', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>', { noremap = true })
