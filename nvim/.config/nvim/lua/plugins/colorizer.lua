local M = {
	"NvChad/nvim-colorizer.lua",
	ft = { "lua", "css" },
}

function M.config()
	require("colorizer").setup({
		filetypes = {
			"css",
			"lua",
		},
		user_default_options = {
			names = false,
			rgb_fn = true,
			hsl_fn = true,
			tailwind = "both",
		},
		buftypes = {},
	})
end

return M
