return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  lazy = true,
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  -- See Commands section for default commands if you want to lazy load on them
  config = function()
    local copilot = require("CopilotChat")
    copilot.setup({
      -- configure copilot chat
      -- see Configuration section for more options
      debug = false, -- Enable debugging
      show_help = false,
      question_header = " ## Sid ",
      answer_header = " ## Assistant ",
      -- See Configuration section for rest
      -- default window options
      window = {
        layout = 'float',                          -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.8,                               -- fractional width of parent, or absolute width in columns when > 1
        height = 0.8,                              -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'editor',                       -- 'editor', 'win', 'cursor', 'mouse'
        border = 'rounded',                        -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil,                                 -- row position of the window, default is centered
        col = nil,                                 -- column position of the window, default is centered
        title = ' Code Assistant Chat ',           -- title of chat window
        footer = " May the force be with you ;) ", -- footer of chat window
        zindex = 1,                                -- determines if window is on top or below other floating windows
      },


    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>cct", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
  end,
}
