local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local function get_opts(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL
-- Resize
keymap("n", "<C-,>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-.>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-=>", ":resize +2<CR>", opts)
keymap("n", "<C-->", ":resize -2<CR>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Buffer navigation
keymap("n", "<leader>l", ":bnext<CR>", get_opts("Next Buffer"))
keymap("n", "<leader>h", ":bprevious<CR>", get_opts("Prev Buffer"))

-- delete without add to register
keymap("n", "x", '"_x', { silent = true })

-- clear highlight search
keymap("n", "<leader>cs", ":nohls<CR>", get_opts("Clear Highlight Search"))

-- split window
keymap("n", "<leader>sv", "<C-w>v", get_opts("Split Verticle"))
keymap("n", "<leader>sh", "<C-w>s", get_opts("Split Horizontal"))
keymap("n", "<leader>se", "<C-w>=", get_opts("Resize Equal"))
keymap("n", "<leader>sx", ":close<CR>", get_opts("Close all"))

-- Tab navigation
keymap("n", "<leader>to", ":tabnew<CR>", get_opts("New"))
keymap("n", "<leader>tx", ":tabclose<CR>", get_opts("Close"))
keymap("n", "<leader>tn", ":tabn<CR>", get_opts("Next"))
keymap("n", "<leader>tp", ":tabp<CR>", get_opts("Prev"))

-- INSERT
-- Fast escape
keymap("i", "jk", "<ESC>", opts)

-- Plugins
-- LSP
-- keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', get_opts('Format Document'))

-- nvim-tree
keymap("n", "<leader>te", ":NvimTreeToggle<CR>", get_opts("Toggle"))
keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", get_opts("Focus File"))
keymap("n", "<leader>tc", ":NvimTreeCollapse<CR>", get_opts("Collapse"))

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", get_opts("Find File"))
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", get_opts("Find Grep"))
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", get_opts("Find Buffer"))
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", get_opts("Help"))
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", get_opts("Find Symbol"))

-- Git conflict
keymap("n", "<leader>cq", "<cmd>GitConflictListQf<CR>", get_opts("List Conflict"))
