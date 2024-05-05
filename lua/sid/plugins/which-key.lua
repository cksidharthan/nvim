-- this plugin helps you to remember the keybindings in neovim by showing a popup with the possible keybindings after pressing a keybinding
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
  
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default configuration
      -- refer to the configuration section below
    }
}