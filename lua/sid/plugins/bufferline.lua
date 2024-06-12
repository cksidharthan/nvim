return {
	"akinsho/bufferline.nvim",
	event = "BufWinEnter",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffer",
				show_tab_indicators = true,
        show_close_icon = true,
        color_icons = true,
        indicator = {
          style = "underline",
        },

				diagnostics = "nvim_lsp",
        separator_style = "slope",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
			},
		})
	end,
}
