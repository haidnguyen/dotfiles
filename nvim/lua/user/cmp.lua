local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts)
	}
})
