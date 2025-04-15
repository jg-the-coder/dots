local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Telescope", -- Lazy-load on :Telescope command
	keys = { -- Lazy-load on key mappings
		{ "<leader>pf", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{
			"<leader>en",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
		},
		{
			"<leader>ep",
			function()
				require("telescope.builtin").find_files({
					---@diagnostic disable-next-line: param-type-mismatch
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end,
		},
	},
}

function M.config()
	require("telescope").setup({
		pickers = {
			find_files = {
				theme = "ivy",
			},
		},
		extensions = {
			fzf = {},
		},
	})
	require("telescope").load_extension("fzf")
end

return M
