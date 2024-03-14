return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		local custom_actions = {}

		function custom_actions.fzf_multi_select(prompt_bufnr)
			local function get_table_size(t)
				local count = 0
				for _ in pairs(t) do
					count = count + 1
				end
				return count
			end

			local picker = action_state.get_current_picker(prompt_bufnr)
			local num_selections = get_table_size(picker:get_multi_selection())

			if num_selections > 1 then
				actions.send_selected_to_qflist(prompt_bufnr)
				actions.open_qflist()
			else
				actions.file_edit(prompt_bufnr)
			end
		end

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				results_title = false,
				layout_strategy = "vertical",
				layout_config = {
					prompt_position = "top",
					height = 0.8,
					preview_height = 0.2,
					width = 0.6,
					anchor = "CENTER",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["<cr>"] = custom_actions.fzf_multi_select,
					},
				},
			},
		})

		telescope.load_extension("fzf")


		-- telescope --
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")
	end,
}
