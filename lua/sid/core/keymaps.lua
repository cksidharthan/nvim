-- Remap space as leader key
-- Must be before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- to escapse insert mode instead of pressing escape
keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert mode with jk" })

-- to clear search highlights that we do with /
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search highlights" })
    
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("n", "<leader>ml", "<cmd>Lazy<cr>")
-- window management
keymap.set("n" ,"<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n" ,"<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n" ,"<leader>se", "<C-w>=", { desc = "Make the size of the splits to be equal" })
keymap.set("n" ,"<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n" ,"<leader>so", "<cmd>only<CR>", { desc = "Close all splits except the current one" })

