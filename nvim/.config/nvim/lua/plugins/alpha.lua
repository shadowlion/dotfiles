return {
	"goolord/alpha-nvim",
  dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
    local theme = require("alpha.themes.startify")
		return alpha.setup(theme.config)
	end,
}
