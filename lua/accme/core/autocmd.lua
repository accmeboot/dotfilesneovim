-- local function toBoolean(value)
-- 	return value == 1
-- end
--
-- vim.api.nvim_create_autocmd({ "UiEnter" }, {
-- 	callback = function()
-- 		local args = vim.v.argv
-- 		local isNvimOpening = args[1] == "nvim"
-- 		local isFolder = toBoolean(vim.fn.isdirectory(args[2]))
-- 		local isGit = args[3] == "g"
--
-- 		if isNvimOpening and isFolder then
-- 			vim.cmd(":Neotree buffers")
-- 			if isGit then
-- 				vim.cmd(":G")
-- 			end
-- 		end
-- 	end,
-- })

-- TODO: Find out why neotree overwrites :G

vim.cmd("let &statuscolumn='%C%s%l'")
