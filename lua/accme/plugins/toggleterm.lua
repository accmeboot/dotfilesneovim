local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
	return
end

toggleterm.setup({
	direction = "float",
	open_mapping = [[<c-`>]],
	-- persist_size = true,
	-- close_on_exit = true,
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "single",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		width = 80,
		height = 20,
		winblend = 0,
	},
})
