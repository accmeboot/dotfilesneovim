-- THEME --
require("accme.themes.gruvbox")

-- adding border to floating windows from LSP
local border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
	focus = true,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border,
	focus = true,
})

vim.diagnostic.config({
	float = { border = border, source = "always", focus = true },
})

-- adding transparency to windows
vim.cmd("highlight FloatBorder guibg=NONE ctermbg=NONE")
vim.cmd("highlight link NormalFloat Normal")
vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
vim.cmd("highlight Pmenu ctermbg=NONE guibg=NONE")

vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
