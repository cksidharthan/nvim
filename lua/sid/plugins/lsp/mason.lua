return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
  event = "VeryLazy",
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- "tsserver",
				-- "html",
				-- "cssls",
				-- "tailwindcss",
				"lua_ls",
				--        "emmet_ls",
				--        "prismals",
				--        "pyright",
				-- "azure_pipelines_ls",
				"bashls",
				"dockerls",
				"docker_compose_language_service",
				-- "grammarly",
				"helm_ls",
				-- "volar",
				-- "vuels",
				"gopls",
				"yamlls",
			},
		})
	end,
}
