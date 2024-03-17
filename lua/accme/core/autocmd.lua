-- vim.cmd("let &statuscolumn='%C %s%l%r │ %T'")
vim.cmd([[
let &statuscolumn='%C %s%{(&filetype !=# "netrw" && &buftype !=# "nofile") ? (v:relnum?v:relnum:v:lnum) : ""} '
]])
