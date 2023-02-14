local starry_setup, starry = pcall(require, "starry")
if not starry_setup then
	return
end

starry.setup({
	custom_colors = function(colors)
		colors.main.white = "#292a30"
		colors.main.gray = "#2f3037"
		colors.main.black = "#393b44"
		colors.main.red = "#ff8170"
		colors.main.green = "#84b360"
		colors.main.yellow = "#d9c97c"
		colors.main.blue = "#4eb0cc"
		colors.main.paleblue = "#6bdfff"
		colors.main.cyan = "#78c2b3"
		colors.main.purple = "#b281eb"
		colors.main.orange = "#ffa14f"
		colors.main.pink = "#ff7ab2"

		colors.main.darkred = "#3b2d2b"
		colors.main.darkgreen = "#243330"
		colors.main.darkyellow = "#fef937"
		colors.main.darkblue = "#0f5bca"
		colors.main.darkcyan = "#acf2e4"
		colors.main.darkpurple = "#dabaff"
		colors.main.darkorange = "#382e27"
	end,
})

vim.g.starry_disable_background = true
vim.g.starry_contrast = false
vim.g.starry_darker_contrast = false
vim.g.starry_borders = true

vim.cmd("colorscheme starry")
vim.cmd("Starry monokai")
