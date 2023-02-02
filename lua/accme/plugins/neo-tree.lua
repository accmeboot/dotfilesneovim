local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

vim.g.loaded_netrw = 2
vim.g.loaded_netrwPlugin = 2

neotree.setup({
	close_if_last_window = "true",
	opup_border_style = "rounded",
	window = {
		position = "float",
		mappings = {
			["o"] = "open",
		},
	},
	filesystem = {
		hijack_netrw_behavior = "open_default",
	},
	source_selector = {
		winbar = false,
		statusline = true,
	},
})
