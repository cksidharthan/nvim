return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
  
      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to previous result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
          },
        },
      })
  
      telescope.load_extension("fzf")
  
      local keymap = vim.keymap
  
      keymap.set("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", { desc = "Fuzzy find files in Current working directory" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find files in Recent files" })
      keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy string in Current working directory" })
      keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy string under cursor in Current working directory" })
      -- add another keymap for listing open buffers
      keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find open buffers" })
      -- find todos
      keymap.set("n", "<leader>ft", "<cmd>Telescope todo<CR>", { desc = "Fuzzy find todos in Current working directory" })
      keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Fuzzy find help tags" })
      keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Fuzzy find keymaps" })
    end,
}
