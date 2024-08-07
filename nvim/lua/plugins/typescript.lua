return {
	{
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({
				go_to_source_definition = {
					fallback = true,
				},
				server = {
					on_attach = function()
						vim.lsp.inlay_hint.enable(true)
					end,
					settings = {
						-- specify some or all of the following settings if you want to adjust the default behavior
						javascript = {
							inlayHints = {
								includeInlayEnumMemberValueHints = true,
								includeInlayFunctionLikeReturnTypeHints = false,
								includeInlayFunctionParameterTypeHints = false,
								includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayPropertyDeclarationTypeHints = false,
								includeInlayVariableTypeHints = false,
							},
						},
						typescript = {
							inlayHints = {
								includeInlayEnumMemberValueHints = true,
								includeInlayFunctionLikeReturnTypeHints = false,
								includeInlayFunctionParameterTypeHints = false,
								includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayPropertyDeclarationTypeHints = false,
								includeInlayVariableTypeHints = false,
							},
						},
					},
				},
			})
		end,
	},
}
