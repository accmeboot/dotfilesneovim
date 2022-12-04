local setup, smoothie = pcall(require, "vim-smoothie")
if not setup then
	return
end

smoothie.setup()
