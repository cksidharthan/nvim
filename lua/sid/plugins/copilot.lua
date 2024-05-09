return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    keys = {
      -- TODO: right now the copilot toggle is not working so I'm using the below keymaps
      { "<leader>cod", "<cmd>Copilot disable<CR>", desc = "Copilot disable" },
      { "<leader>coe", "<cmd>Copilot enable<CR>", desc = "Copilot enable" },
    },
    opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          -- udr tab to accept suggestion
          accept = "<Tab>",
          dismiss = "<M-h>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      filetypes = {
        ["."] = true,
        go = true,
        yaml = true,
        json = true,
        toml = true,
        lua = true,
        python = true,
        javascript = true,
        typescript = true,
        c = false,
        cpp = false,
      },
      server_opts_overrides = {},
    },
}
