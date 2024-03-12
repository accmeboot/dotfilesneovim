local opt = vim.opt -- options gloabals variable

-- line numbers
opt.relativenumber = true

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
-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
-- opt.background = "transparent" -- doesn't work this way
opt.signcolumn = "yes" -- adds to the termguicolor something

-- backspace
opt.backspace = "indent,eol,start" --- I HAVE NO IDEA WHAT IT

-- clipboard
opt.clipboard:append("unnamedplus") -- for copy/paste from the outside

-- split windows
opt.splitright = true
opt.splitbelow = true

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

opt.spelllang = "en_us"
opt.spell = true

-- keep cursor in the middle of the screen (almost)
opt.scrolloff = 10
opt.updatetime = 50
