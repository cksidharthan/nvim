-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",

    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",

    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",

    -- Add your own debuggers here
    "leoluz/nvim-dap-go",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("nvim-dap-virtual-text").setup({})

    require("mason-nvim-dap").setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        "delve",
      },
    })

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F5>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Breakpoint" })
    --  stop the debugger
    vim.keymap.set("n", "<leader>dx", dap.disconnect, { desc = "Debug: Stop" })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
      },
      force_buffers = false,
      element_mappings = {
        close = { "q", "<Esc>" },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        mappings = {
          close = { "q", "<Esc>" },
        },
        border = {
          enable = true,
          focusable = true,
          highlight = "Normal",
        },
      },
      render = {
        show_on = "never",
        indent = 2,
      },
      border = {
        enable = true,
        focusable = true,
        highlight = "Normal",
      },
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      -- all the icons should be like jetbrains icons
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "",
          terminate = "",
          disconnect = "",
        },
      },
      expand_lines = true,
      layouts = { {
        elements = {
          {
            id = "console",
            size = 0.5
          },
          {
            id = "breakpoints",
            size = 0.5
          },
          {
            id = "stacks",
            size = 0
          },
          {
            id = "watches",
            size = 0
          }
        },
        position = "left",
        size = 40
      }, {
        elements = {
          {
            id = "repl",
            size = 0.50
          },
          {
            id = "scopes",
            size = 0.50
          }
        },
        position = "bottom",
        size = 10
      }
      },

    })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    -- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    -- dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Install golang specific config
    require("dap-go").setup()
    vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test, { desc = "Debug: Test" })
  end,
}
