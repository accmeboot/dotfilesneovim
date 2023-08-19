-- ATUMATIC PACKER (plugin manager) INSTALATION --

-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- plugin that is required for telescope to work

	use("https://github.com/echasnovski/mini.indentscope")
	use("lukas-reineke/indent-blankline.nvim") -- indent lines

	use("https://github.com/morhetz/gruvbox")
	use("https://github.com/sainnhe/gruvbox-material")
	use("https://github.com/sainnhe/sonokai")
	use("https://github.com/arzg/vim-colors-xcode")

	use("ray-x/starry.nvim")

	use("christoomey/vim-tmux-navigator") -- navigation between split windows via ctrl + h/j/k/l

	use("numToStr/Comment.nvim") -- comment out on gc

	use("JoosepAlviste/nvim-ts-context-commentstring") -- better comenting

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Floating cmdline
	use({
		"VonHeikemen/fine-cmdline.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})

	use("nvim-tree/nvim-web-devicons") -- icons for the explorer

	use("nvim-lualine/lualine.nvim") -- bottom statusline

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependancy for telescope
	use("nvim-telescope/telescope.nvim") -- fzf

	-- autocomplition
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing & installing lsp servers --
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers --
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- closing tags highlight --
	use({
		"andymass/vim-matchup",
	})

	-- css colors --
	use("norcalli/nvim-colorizer.lua")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- golang --
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommanded if need floating window support
	use("https://github.com/fatih/vim-go")

	-- better syntaxis highlight --
	use("sheerun/vim-polyglot")

	-- git --
	use("https://github.com/tpope/vim-fugitive")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
