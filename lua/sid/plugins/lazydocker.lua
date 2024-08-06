return {
  "crnvl96/lazydocker.nvim",
  cmd = "LazyDocker",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("lazydocker").setup({})

    vim.keymap.set({"n", "v"}, "<leader>ld", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })
  end,
}
