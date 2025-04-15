local M = {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
}

function M.config()
	require("alpha").setup(require("alpha.themes.startify").config)
end

return M
