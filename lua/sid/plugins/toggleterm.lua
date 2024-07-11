return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    local toggleterm = require('toggleterm')

    toggleterm.setup({
      open_mapping = [[<c-\>]],
      hide_number = true,
      start_in_insert = true,
      direction = 'horizontal', -- vertical | float | tab
    })
    vim.keymap.set("n", "<leader>tt", "<cmd>lua require('toggleterm').toggle()<CR>", { desc = "Toggle Terminal" })
  end,
}
