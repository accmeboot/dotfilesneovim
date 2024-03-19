return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- Really awkward remapping, but it's the only way to reset the help mappings
		local reset_help_mappings = {
			["to"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "to" } },
			["toc"] = { "order_by_created", nowait = false },
			["tod"] = { "order_by_diagnostics", nowait = false },
			["tog"] = { "order_by_git_status", nowait = false },
			["tom"] = { "order_by_modified", nowait = false },
			["ton"] = { "order_by_name", nowait = false },
			["tos"] = { "order_by_size", nowait = false },
			["tot"] = { "order_by_type", nowait = false },

			["o"] = { "open", nowait = true, noremap = true },

			["oc"] = "",
			["od"] = "",
			["og"] = "",
			["om"] = "",
			["on"] = "",
			["os"] = "",
			["ot"] = "",
		}

		require("neo-tree").setup({
			window = {
				position = "current",
				mappings = {
					["o"] = { "open", nowait = true, noremap = true },
				},
			},
			git_status = {
				window = {
					mappings = reset_help_mappings,
				},
			},
			buffers = {
				follow_current_file = {
					enabled = true,
				},
				window = {
					mappings = reset_help_mappings,
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				window = {
					mappings = reset_help_mappings,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>")
	end,
}
