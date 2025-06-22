return {
	{ "b0o/schemastore.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				dependencies = {
					"WhoIsSethDaniel/mason-tool-installer.nvim",
				},
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
			}, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "ray-x/lsp_signature.nvim" },
		},
		config = function()
			-- Mason
			local mason_tool_installer = require("mason-tool-installer")
			local mason = require("mason")

			mason.setup({
				automatic_installation = true,
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd",
					"stylua", -- lua formatter
				},
			})

			-- lspconfig
			local lsp = require("lsp-zero").preset("recommended")
			local util = require("lspconfig.util")
			local lspconfig = require("lspconfig")
			local keymap = vim.keymap.set
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			lsp.on_attach(function(client, bufnr)
				local function get_opts(desc)
					return {
						noremap = true,
						silent = true,
						buffer = bufnr,
						desc = desc,
					}
				end

				keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", get_opts("LSP Finder"))
				keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", get_opts("Go to definition"))
				keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", get_opts("Peek definition"))
				keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", get_opts("Go to implementation"))
				keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", get_opts("Code Action"))
				keymap("n", "<leader>cn", "<cmd>Lspsaga rename<CR>", get_opts("Rename"))
				keymap("n", "<leader>cD", "<cmd>Lspsaga show_line_diagnostics<CR>", get_opts("Show line diagnostics"))
				keymap(
					"n",
					"<leader>cd",
					"<cmd>Lspsaga show_cursor_diagnostics<CR>",
					get_opts("Show cursor diagnostics")
				)
				keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", get_opts("Jump prev diagnostic"))
				keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", get_opts("Jump next diagnostic"))
				keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", get_opts("Show hover doc"))
				-- keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.ensure_installed({
				"ts_ls",
				"lua_ls",
				"eslint",
				"angularls",
				"html",
				"cssls",
				"jsonls",
				"tailwindcss",
			})

			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

			lspconfig.angularls.setup({
				root_dir = util.root_pattern("angular.json", "project.json", "nx.json"),
			})

			lspconfig.html.setup({
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentFormattingRangeProvider = false
				end,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less", "htmlangular" },
			})

			lspconfig.eslint.setup({
				root_dir = util.root_pattern("package.json", ".eslintrc.json"),
			})

			lspconfig.jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.nxls.setup({
				root_dir = util.root_pattern("nx.json", ".git"),
			})
			lspconfig.ts_ls.setup({})

			lsp.setup()

			-- autocomplete
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()
			local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp_action.tab_complete(),
					["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select_opts),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select_opts),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, { name = "buffer" }),
			})
		end,
	},
}
