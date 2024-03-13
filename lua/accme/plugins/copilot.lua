require("CopilotChat").setup({
	show_help = "yes",         -- Show help text for CopilotChatInPlace, default: yes
	debug = false,             -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
	disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
	language = "English",      -- Copilot answer language settings when using default prompts. Default language is English.
	-- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
	-- temperature = 0.1,
	window = {
		layout = "float",
		border = "rounded",
	},
	mappings = {
		complete = '<leader>c',
	},
})

vim.keymap.set('n', '<leader>b', ':CopilotChatToggle<CR>')
vim.keymap.set('v', '<leader>b', ':<C-U>CopilotChatToggle<CR>')
