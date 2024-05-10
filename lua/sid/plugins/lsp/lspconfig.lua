return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require("lspconfig").gopls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
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
                    enable = true,
                    singleQuote = true,
                    printWidth = 120,
                },
                hover = true,
                completion = true,
                validate = true,
                schemas = {
                    ["https://taskfile.dev/schema.json"] = {
                        "/Taskfile.yml",
                        "/Taskfile.yaml",
                    },
                    ["https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json"] = {
                        "/azure-pipelines.yml",
                        "/azure-pipelines.yaml",
                        "/azure/**/*.yml",
                        "/azure/**/*.yaml",
                    },
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
