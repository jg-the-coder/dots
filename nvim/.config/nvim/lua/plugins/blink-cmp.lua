return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { { "rafamadriz/friendly-snippets" }, { "L3MON4D3/LuaSnip", version = "v2.*" } },
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "mono",
		},

		signature = { enabled = true },
		completion = {
			menu = {
				border = "rounded",
			},
			ghost_text = {
				enabled = true,
			},
			documentation = { auto_show = true },
		},

		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
