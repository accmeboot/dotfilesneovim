return {
	"https://github.com/sainnhe/gruvbox-material",
	config = function()
		vim.g.gruvbox_material_foreground = "mix" -- material, mix, original
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_transparent_background = 1 -- 0, 1 or 2
		vim.g.gruvbox_material_statusline_style = "default" -- "original", "default", "mix"
		vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted" -- "grey", "colored", "highlighted"

		-- vim.cmd("colorscheme gruvbox-material")
	end,
}
