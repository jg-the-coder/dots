local M = {
	"alexghergh/nvim-tmux-navigation",
	event = "VeryLazy",
	config = function()
		require("nvim-tmux-navigation").setup({
			disable_when_zoomed = true,
			keybindings = {
				left = "<c-h>",
				down = "<c-j>",
				up = "<c-k>",
				right = "<c-l>",
				last_active = "<c-\\>",
				next = "<c-]>",
			},
		})
	end,
}

return M
