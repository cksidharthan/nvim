return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			-- Enable transparent background
			transparent = false,

			-- Enable italics comments
			italic_comments = true,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,

			-- Modern borderless telescope theme
			borderless_telescope = false,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			theme = {
				variant = "default", -- use "light" for the light variant
				highlights = {
					-- Highlight groups to override, adding new groups is also possible
					-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

					-- Example:
					Comment = { fg = "#696969", bg = "NONE", italic = true },

					-- Complete list can be found in `lua/cyberdream/theme.lua`
				},

				-- Override a color entirely
				colors = {
					-- For a list of colors see `lua/cyberdream/colours.lua`
					-- Example:
					green = "#00ff00",
					magenta = "#ff00ff",
				},
			},
		})
    vim.cmd("colorscheme cyberdream")
	end,
}
