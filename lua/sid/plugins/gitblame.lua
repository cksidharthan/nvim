return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup()

		local keymap = require("vim.keymap")

		-- Toggle blame window using :BlameToggle
		keymap.set("n", "<leader>gb", ":BlameToggle<CR>", { desc = "Toggle git blame window" })
	end,
}
