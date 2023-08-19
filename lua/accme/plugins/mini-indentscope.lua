local status, mini_indentscope = pcall(require, "mini.indentscope")
if not status then
	return
end

mini_indentscope.setup({
	symbol = "│",
})
