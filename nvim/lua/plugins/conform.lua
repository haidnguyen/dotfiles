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
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end

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

					return { timeout_ms = 500, lsp_format = "fallback" }, on_format
				end,

				format_after_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end

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

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
		end,
	},
}
