-- print("Hello from lazy!")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

local plugins = "plugins" or {}
local opts = {

	install = {
		missing = true,
	},

	change_detection = {
		enabled = true,
		notify = false,
	},

	checker = {
		enabled = true,
		notify = false,
	},

	ui = {
		border = "rounded",
	},

	performance = {
		cache = { enabled = true },
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"bugreport",
				"compiler",
				"ftplugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"optwin",
				"rplugin",
				"rrhelper",
				"spellfile_plugin",
				"synmenu",
				"syntax",
				"tar",
				"tarPlugin",
				"tohtml",
				"filetype",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"shada",
				"matchparen",
				"osc52",
				"man",
				"editorconfig",
				"spellfile",
			},
		},
	},
}

lazy.setup(plugins, opts)
