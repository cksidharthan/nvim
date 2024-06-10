return {
	"j-hui/fidget.nvim",
	config = function()
		local fidget = require("fidget")

		fidget.setup({
			-- Options related to notification subsystem
			notification = {
				override_vim_notify = true, -- Automatically override vim.notify() with Fidget
			},
		})
	end,
}
