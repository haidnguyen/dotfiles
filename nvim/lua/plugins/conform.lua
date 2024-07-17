return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function()
			local conform = require("conform")

			local format_options = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			}
			local slow_format_filetypes = {}

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					javascriptreact = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					svelte = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					html = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					yaml = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
					graphql = { "prettierd", "prettier" },
					lua = { "stylua" },
				},
				format_on_save = function(bufnr)
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					if bufname:match("/node_modules/") then
						return
					end

					if slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					local function on_format(err)
						if err and err:match("timeout$") then
							slow_format_filetypes[vim.bo[bufnr].filetype] = true
						end
					end

					return { timeout_ms = 200, lsp_format = "fallback" }, on_format
				end,

				format_after_save = function(bufnr)
					if not slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					return { lsp_format = "fallback" }
				end,
			})

			-- mapping format command
			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format(format_options)
			end, {
				noremap = true,
				silent = true,
				desc = "Format Document",
			})
		end,
	},
}
