vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("accme.lazy")
require("accme.plugins.nvim-tree")
require("accme.plugins.nvim-cmp")
require("accme.core.autocmd")
require("accme.core.options")
require("accme.core.keymaps")
require("accme.plugins.comment")
-- require("accme.plugins.lualine")
require("accme.plugins.telescope")
require("accme.plugins.lsp.mason")
require("accme.plugins.lsp.lspconfig")
require("accme.plugins.lsp.efmls")
require("accme.plugins.autopairs")
require("accme.plugins.treesitter")
require("accme.plugins.lsp.polyglot")
require("accme.plugins.vim-matchup")
require("accme.plugins.nvim-colorizer")
require("accme.plugins.mini-indentscope")

-- THEME --
require("accme.themes.gruvbox")
-- require("accme.themes.fleet")

require("accme.core.colorscheme")
