return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path", -- source for file system paths
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-b>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- language server protocol
        -- { name = "luasnip" }, -- snippets
        -- { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      sorting = {
        priority_weight = 2, -- sort by source priority
        comparators = {
          cmp.config.compare.offset, -- sort by cursor position
          cmp.config.compare.exact, -- sort by exact match
          cmp.config.compare.score, -- sort by score
          cmp.config.compare.kind, -- sort by kind
          cmp.config.compare.length, -- sort by length
          cmp.config.compare.order, -- sort by order
        },
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
