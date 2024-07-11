return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plugin
		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require("lspconfig").gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				gopls = {
					analyses = {
            completeUnimported = true,
						unusedparams = true,
            usePlaceholders = true,
					},
					staticcheck = true,
				},
			},
		})

    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

		require("lspconfig").tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig").pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig").rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig").yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "yaml", "yml" },
			flags = { debounce_test_changes = 150 },
			settings = {
				yaml = {
					format = {
						enable = false,
						-- singleQuote = true,
						-- printWidth = 120,
					},
					hover = true,
					completion = true,
					validate = true,
					schemas = {
						-- get schema file from local nvim path
						[vim.fn.expand("~/.config/nvim/lua/sid/plugins/lsp/schemas/taskfile-schema.json")] = {
							"/Taskfile.yml",
							"/Taskfile.yaml",
						},
						-- [vim.fn.expand("~/.config/nvim/lua/sid/plugins/lsp/schemas/azure-pipeline.json")] = {
						-- 	"/azure-pipelines.yml",
						-- 	"/azure-pipelines.yaml",
						-- 	"/azure/**/*.yml",
						-- 	"/azure/**/*.yaml",
						-- },
					},
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/json",
					},
				},
			},
		})
	end,
}
