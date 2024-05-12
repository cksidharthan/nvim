return {
	"NvChad/nvim-colorizer.lua",
	event = "BufRead",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				names = false,
			},
		})
	end,
}
