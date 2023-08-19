local setup, cmdline = pcall(require, "fine-cmdline")
if not setup then
	return
end

cmdline.setup({
	popup = {
		position = {
			row = "95%",
			col = "0%",
		},
		size = {
			width = "20%",
		},
	},
})
