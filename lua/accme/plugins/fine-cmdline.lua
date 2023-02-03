local setup, cmdline = pcall(require, "fine-cmdline")
if not setup then
	return
end

cmdline.setup({
	popup = {
		position = {
			row = "50%",
			col = "50%",
		},
	},
})
