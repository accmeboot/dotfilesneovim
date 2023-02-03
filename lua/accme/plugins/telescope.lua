local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local actions_state_setup, action_state = pcall(require, "telescope.actions.state")
if not actions_state_setup then
	return
end

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
