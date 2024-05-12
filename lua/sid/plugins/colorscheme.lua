return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	opts = {},
	config = function()
		require("nightfox").setup({
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		})
		vim.cmd("colorscheme carbonfox")
	end,
}
