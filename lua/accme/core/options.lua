local opt = vim.opt -- options gloabal variable

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
-- opt.background = "transparent" -- doesn't work this way
opt.signcolumn = "yes" -- addes to the termguicolor something

-- backspace
opt.backspace = "indent,eol,start" --- I HAVE NO IDEA WHAT IT DOES

-- clipboard
opt.clipboard:append("unnamedplus") -- for copy/paste from the outside

-- split windows
opt.splitright = true
opt.splitbelow = true

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	command = ":Neotree float",
})
