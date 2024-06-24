return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		-- configure lualine with modified theme
		lualine.setup({
			options = {
        icons_enabled = true,
				-- theme = my_lualine_theme,
        theme = "powerline",
        -- component_separators = { right = "█", left = "█" },
        section_separators = { right = "█" , left = "█" },
			},
			sections = {
				lualine_x = {
					{
						"copilot",
						-- Default values
						symbols = {
							status = {
								icons = {
									enabled = "🟢",
									sleep = "😴", -- auto-trigger disabled
									disabled = "🔒",
									warning = "☢️",
									unknown = "🚫",
								},
								hl = {
									enabled = "#50FA7B",
									sleep = "#AEB7D0",
									disabled = "#6272A4",
									warning = "#FFB86C",
									unknown = "#FF5555",
								},
							},
							spinners = require("copilot-lualine.spinners").dots,
							spinner_color = "#6272A4",
						},
						show_colors = false,
						show_loading = true,
					},
					{ "encoding" },
					{ "fileformat", symbols = { unix = "🍎" } },
					{ "filetype" },
				},
				lualine_a = {
					{ "mode", icon = "" },
				},
				lualine_c = {
					{
						"filename",
						file_status = true, -- Displays file status (readonly status, modified status)
						newfile_status = false, -- Display new file status (new file means no write after created)
						path = 4, -- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory

						shorting_target = 40, -- Shortens path to leave 40 spaces in the window
						-- for other components. (terrible name, any suggestions?)
						symbols = {
							modified = "[+]", -- Text to show when the file is modified.
							readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "[New]", -- Text to show for newly created file before first write
						},
					},
				},
			},
		})
	end,
}
