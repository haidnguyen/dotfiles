local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten keymap
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal

-- Windows navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<leader>e', ':Lex 30<cr>', opts)

-- Rezize with arrows
keymap('n', '<leader>rv', ':resize +4<cr>', opts)
keymap('n', '<leader>rh', ':vertical resize +4<cr>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bn<cr>', opts)
keymap('n', '<S-h>', ':bp<cr>', opts)

-- Insert
-- Fast escape
keymap('i', 'jk', '<ESC>', opts)

-- Move text up and down
keymap('n', '∆', '<Esc>:m .+1<CR>', opts)
keymap('n', '˚', '<Esc>:m .-2<CR>', opts)

-- Stay in indent mode
-- Visual
keymap('v', '<C-]>', '>gv', opts)
keymap('v', '<C-[>', '<gv', opts)

-- Move text up and down
keymap('v', '∆', ':m .+1<CR>gv', opts)  -- Alt + j
keymap('v', '˚', ':m .-2<CR>gv', opts)  -- Alt + k
keymap('v', 'p', '"_dP', opts)

