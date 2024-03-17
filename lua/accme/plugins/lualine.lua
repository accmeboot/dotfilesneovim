return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = {},
				lualine_b = {
					{
						"branch",
						component_separators = { left = "»", right = "«" },
						icon = "⎇`",
					},
					"diff",
				},
				lualine_c = {
					{
						"filename",
						component_separators = { left = "»", right = "«" },
						path = 1,
					},
					{
						"diagnostics",
						symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
						component_separators = { left = "»", right = "«" },
					},
				},
				lualine_x = {
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
