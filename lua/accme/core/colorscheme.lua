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
	float = { border = border, source = true, focus = true },
})

-- adding transparency to windows
vim.cmd("highlight FloatBorder guibg=NONE ctermbg=NONE")
vim.cmd("highlight link NormalFloat Normal")
vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
vim.cmd("highlight Pmenu ctermbg=NONE guibg=NONE")

vim.cmd("highlight DiffAdd guibg=#3D3D3D")
vim.cmd("highlight DiffDelete guibg=#3D3D3D")
vim.cmd("highlight DiffChange guibg=#3D3D3D")
vim.cmd("highlight DiffText guibg=#3E3323 guifg=#E0A135")

-- ssasdes.load()
