local function filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return " "
	end

	return string.format(" %%<%s/", fpath)
end

local function filename()
	local fname = vim.fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return fname .. " "
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = "%#LspDiagnosticsSignError#E:" .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = "%#LspDiagnosticsSignWarning#W:" .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = "%#LspDiagnosticsSignHint#H:" .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = "%#LspDiagnosticsSignInformation#I:" .. count["info"]
	end

	return errors .. warnings .. hints .. info
end

local function filetype()
	return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return " %P %l:%c "
end

local function get_git_branch()
	local fugitive = vim.fn.exists("*FugitiveHead") == 1 and vim.fn.FugitiveHead() or ""
	return fugitive ~= "" and "%#VirtualTextInfo#" .. " " .. fugitive .. " " or ""
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		get_git_branch(),
		"%#Statusline#",
		"%=%#StatuslineExtra#",
		filepath(),
		filename(),
		"%=%#StatuslineExtra#",
		lsp(),
		"%#Statusline#",
		filetype(),
		lineinfo(),
	})
end

function Statusline.inactive()
	return " %F"
end

vim.api.nvim_exec2(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]],
	{ output = false }
)

-- WINDOWS COLORSCHEME --
-- {
--     "background": "#282C34",
--     "black": "#282C34",
--     "blue": "#61AFEF",
--     "brightBlack": "#5A6374",
--     "brightBlue": "#61AFEF",
--     "brightCyan": "#56B6C2",
--     "brightGreen": "#98C379",
--     "brightPurple": "#C678DD",
--     "brightRed": "#E06C75",
--     "brightWhite": "#DCDFE4",
--     "brightYellow": "#E5C07B",
--     "cursorColor": "#FFFFFF",
--     "cyan": "#56B6C2",
--     "foreground": "#DCDFE4",
--     "green": "#98C379",
--     "name": "One Half Dark",
--     "purple": "#C678DD",
--     "red": "#E06C75",
--     "selectionBackground": "#FFFFFF",
--     "white": "#DCDFE4",
--     "yellow": "#E5C07B"
-- },
