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
		"eslint_d",
	},
})
