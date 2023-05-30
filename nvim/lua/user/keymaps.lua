local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- NORMAL
-- Resize
keymap('n', '<C-,>', ':vertical resize +2<CR>', opts)
keymap('n', '<C-.>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-=>', ':resize +2<CR>', opts)
keymap('n', '<C-->', ':resize -2<CR>', opts)

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

-- Buffer navigation
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)


-- delete without add to register
keymap('n', 'x', '"_x', { silent = true })

-- split window
keymap('n', '<leader>sv', '<C-w>v', opts)
keymap('n', '<leader>sh', '<C-w>s', opts)
keymap('n', '<leader>se', '<C-w>=', opts)
keymap('n', '<leader>sx', ':close<CR>', opts)

-- Tab navigation
keymap('n', '<leader>to', ':tabnew<CR>', opts)
keymap('n', '<leader>tx', ':tabclose<CR>', opts)
keymap('n', '<leader>tn', ':tabn<CR>', opts)
keymap('n', '<leader>tp', ':tabp<CR>', opts)

-- INSERT
-- Fast escape
keymap('i', 'jk', '<ESC>', opts)
