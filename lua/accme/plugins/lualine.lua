return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = {},
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = { "filetype", "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
