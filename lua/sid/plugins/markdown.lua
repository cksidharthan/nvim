return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Used by the code bloxks
	},
	config = function()
		require("markview").setup({})
	end,
}
