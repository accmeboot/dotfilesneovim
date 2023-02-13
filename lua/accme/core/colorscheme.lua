-- adding border to floating windows from LSP
local border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border,
})

vim.diagnostic.config({
	float = { border = border },
})
-----------------------------------------------

vim.g.sonokai_better_performance = 1 --For Better Performance
vim.g.sonokai_transparent_background = 2 -- 0, 1 or 2
vim.g.sonokai_style = "atlantis"

vim.g.starry_disable_background = true
vim.g.starry_contrast = false

vim.cmd("colorscheme starry")
vim.cmd("Starry dracula")

vim.cmd([[
    try
        colorscheme starry
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
        highlight FloatBorder guibg=NONE ctermbg=NONE " Removes the border of float menu (LSP and Autocompletion uses it)
        highlight link NormalFloat Normal
        highlight NormalFloat ctermbg=NONE guibg=NONE
        highlight Pmenu ctermbg=NONE guibg=NONE
]])
