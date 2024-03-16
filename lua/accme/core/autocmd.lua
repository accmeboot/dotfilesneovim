-- this add the space at the line numbers column
vim.cmd("set number relativenumber") -- Set relative numbers and absolute numbers for the current line
vim.cmd("let &statusline=' %C %s%l%r'") -- Add a space before signs
