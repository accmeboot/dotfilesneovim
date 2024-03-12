local function get_max_suggestion_length(suggestions)
	local max_length = 0
	for _, suggestion in ipairs(suggestions) do
		local length = #suggestion
		if length > max_length then
			max_length = length
		end
	end
	return max_length
end

local function get_win_dimensions()
	local win_height = vim.api.nvim_win_get_height(0)
	local height = math.floor(win_height / 3)

	local cursor = vim.api.nvim_win_get_cursor(0)
	local cursor_row = cursor[1]
	local cursor_col = cursor[2]

	local first_visible_line = vim.fn.line("w0")
	local space_below = win_height - (cursor_row - first_visible_line + 1)

	local row
	if space_below >= height then
		row = cursor_row - first_visible_line + 1 -- 1 line to put it bellow the cursor
	else
		row = cursor_row - height - 3 -- 3 lines because the window is put below the line + it has margins
	end

	return height, row, cursor_col, cursor_row
end

local function prepare_win(win)
	local hint_hl = vim.api.nvim_get_hl_by_name("VirtualTextHint", true)
	local hint_bg = hint_hl["background"]
	local hint_fg = hint_hl["foreground"]

	if hint_bg and hint_fg then
		hint_bg = string.format("%x", hint_bg)
		hint_fg = string.format("%x", hint_fg)
		vim.cmd("highlight MyCursorLine guibg=#" .. hint_bg .. " guifg=#" .. hint_fg)
		vim.api.nvim_win_set_option(win, "cursorlineopt", "line")
		vim.api.nvim_win_set_option(win, "winhighlight", "CursorLine:MyCursorLine")
	end

	vim.api.nvim_win_set_option(win, "relativenumber", false)
	vim.api.nvim_win_set_option(win, "statuscolumn", " %l")
	vim.api.nvim_win_set_option(win, "number", true)
	vim.api.nvim_win_set_option(win, "cursorline", true)
end

local function create_floating_window(width)
	local buf = vim.api.nvim_create_buf(false, true)

	local height, row, col = get_win_dimensions()

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "win",
		width = width + 7, -- 7 is the padding of the window,
		height = height,
		border = "rounded",
		style = "minimal",
		row = row,
		col = col,
	})

	prepare_win(win)

	return buf
end

local function get_suggestions()
	local suggestions = vim.fn.spellsuggest(vim.fn.expand("<cword>"))
	if #suggestions == 0 then
		return nil
	end

	return suggestions
end

function _G.close_spell_suggestion_window()
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_win_close(0, true)
	vim.api.nvim_buf_delete(buf, { force = true })
end

function _G.replace_word_from_spell_suggestion_window()
	local buf = vim.api.nvim_get_current_buf()
	local line = vim.api.nvim_buf_get_lines(buf, vim.fn.line(".") - 1, vim.fn.line("."), false)[1]
	close_spell_suggestion_window()
	vim.cmd("normal ciw" .. line)
end

function _G.open_spell_suggestions()
	local suggestions = get_suggestions()
	local width = get_max_suggestion_length(suggestions)
	local buf = create_floating_window(width)

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, suggestions)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<CR>",
		"<Cmd>lua replace_word_from_spell_suggestion_window()<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Esc>",
		"<Cmd>lua close_spell_suggestion_window()<CR>",
		{ noremap = true, silent = true }
	)
end

vim.cmd("command! -nargs=0 SpellSuggestions lua open_spell_suggestions()")
