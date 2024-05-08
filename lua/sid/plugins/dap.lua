return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "leoluz/nvim-dap-go",
    { "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },

  config = function()
    local dap = require("dap")
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup({})
    require("dap-go").setup()
    local dapui = require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

  end,
}
