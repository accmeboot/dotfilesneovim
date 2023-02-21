local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

local utils_setup, utils = pcall(require, "ts_context_commentstring.utils")
if not utils_setup then
	return
end

local internal_setup, internal = pcall(require, "ts_context_commentstring.internal")
if not internal_setup then
	return
end

comment.setup({
	-- Linters prefer comment and line to have a space in between markers
	marker_padding = true,
	-- should comment out empty or whitespace only lines
	comment_empty = true,
	-- Should key mappings be created
	create_mappings = true,
	-- Normal mode mapping left hand side
	line_mapping = "gcc",
	-- Visual/Operator mapping left hand side
	operator_mapping = "gc",
	pre_hook = function(ctx)
		local U = require("Comment.utils")

		local location = nil

		if ctx.ctype == U.ctype.block then
			location = utils.get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = utils.get_visual_start_location()
		end

		return internal.calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__multiline",
			location = location,
		})
	end,
})
