return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local nvimtree = require("nvim-tree")
  
      -- recommended settings
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
  
      nvimtree.setup({
        view = {
          width = 35,
          relativenumber = true,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        -- change folder arrow icons
        renderer = {
          -- add root folder as current folder by getting the current working directory and just show the folder name instead of the full path
          root_folder_label = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
          indent_markers = {
            enable = true,
          },
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "→",
                arrow_open = "↓",
              },
            },
          },
        },
 
        --disable window_ticker for explorer to work well with window splits
        actions = {
          open_file = {
            window_picker = {
              enable = true,
            },
            resize_window = true,
          },
        },
        filters = {
          custom = { ".DS_Store", ".trunk", ".idea", ".vscode", "node_modules", "vendor"},
        },
        git = {
          ignore = false,
        },
      })
  
  
      -- set keymaps
      local keymap = vim.keymap
  
      keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
      keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer in current folder" })
      keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
      keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end
}  
