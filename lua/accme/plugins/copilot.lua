return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = { "github/copilot.vim" },
	event = "VeryLazy",
	branch = "canary",
	config = function()
		local chat = require("CopilotChat")
		chat.setup({
			show_help = "no", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
			language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
			-- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
			-- temperature = 0.1,
			window = {
				layout = "horizontal",
				border = "rounded",
			},
			mappings = {
				complete = "<C-c>",
			},
		})

		local function open_h_split()
			chat.toggle({
				window = {
					layout = "float",
				},
			})
		end

		vim.keymap.set("n", "<C-a>b", ":CopilotChatToggle<CR>")
		vim.keymap.set("v", "<C-a>b", ":<C-U>CopilotChatToggle<CR>")
		vim.keymap.set("n", "<C-a>h", open_h_split)
		vim.keymap.set("v", "<C-a>h", open_h_split)
	end,
}
