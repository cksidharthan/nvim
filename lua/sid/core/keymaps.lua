-- Remap space as leader key
-- Must be before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- to escape insert mode instead of pressing escape
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

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffer management
keymap.set("n", "<leader>cb", "<cmd>bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>nb", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>pb", "<cmd>bp<CR>", { desc = "Go to previous buffer" })

-- code navigation
keymap.set("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
keymap.set("n", "<C-[>", "<C-o>", { desc = "Go back to previous location" })
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover information" })

keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "Format code" })
keymap.set("n", "<leader>cd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { desc = "Show line diagnostics" })
keymap.set("n", "<leader>cn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })

-- dap keymaps
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<F5>", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "<leader>dl", ":lua require'dap'.run_last()<CR>")
keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
keymap.set("n", "<leader>di", ":lua require'dap.ui.widgets'.hover()<CR>")
keymap.set("n", "<leader>dx", ":lua require'dap'.close()<CR>")
keymap.set("n", "<leader>dt", ":lua require'dap'.terminate()<CR>")

-- nvim-ufo keymaps
keymap.set('n', 'fo', ":lua require('ufo').openAllFolds()<CR>")
keymap.set('n', 'fc', ":lua require('ufo').closeAllFolds()<CR>")
keymap.set('n', 'zm', ":lua require('ufo').closeFoldsWith()<CR>") -- closeAllFolds == closeFoldsWith(0)
keymap.set('n', 'zp', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsps.buf.hover()
  end
end, {desc = 'Peek folded lines under cursor'})

-- noice keymaps
keymap.set('n', 'nd', ":NoiceDismiss<CR>", { desc = "Dismiss Noice" })
