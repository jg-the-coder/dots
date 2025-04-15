return {
	{
		"mawkler/modicator.nvim",
		event = "VeryLazy",
		enabled = false,
		config = function()
			require("modicator").setup({
				show_warnings = false,
				highlights = {
					defaults = {
						bold = true,
						italic = false,
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = {
				show_start = false,
				show_end = true,
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},

		main = "ibl",
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},

	{
		"karb94/neoscroll.nvim",
		-- enabled = false,
		config = function()
			require("neoscroll").setup({
				stop_eof = true,
				easing_function = "sine",
				hide_cursor = true,
				cursor_scrolls_alone = true,
			})
		end,
	},
	{
		-- Neovim plugin to improve the default vim.ui interfaces
		"stevearc/dressing.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		config = function()
			require("dressing").setup()
		end,
	},
}
