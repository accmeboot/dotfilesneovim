local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Required by lazy
vim.g.mapleader = " "

local plugins = {
	-- copilot
	{ "github/copilot.vim" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
	},

	{ "nvim-lua/plenary.nvim" },
	{ "https://github.com/echasnovski/mini.indentscope" }, -- animated highilting the current code selection
	{ "lukas-reineke/indent-blankline.nvim" },            -- indent lines
	-- themes --
	{ "https://github.com/sainnhe/gruvbox-material" },

	-- tmux integration--
	{ "christoomey/vim-tmux-navigator" },             -- navigation between split windows via ctrl + h/j/k/l

	{ "numToStr/Comment.nvim" },                      -- comment out on gc
	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- better comenting

	--telescope
	{ "nvim-telescope/telescope-fzf-native.nvim",       build = "make" },
	{ "nvim-telescope/telescope.nvim" },

	-- autocomplition
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- snippets
	{ "L3MON4D3/LuaSnip" },
	-- { "saadparwaiz1/cmp_luasnip" },
	-- { "rafamadriz/friendly-snippets" },

	-- managing & installing lsp servers --
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- configuring lsp servers --
	{ "neovim/nvim-lspconfig" }, -- easily configure language servers
	{ "hrsh7th/cmp-nvim-lsp" }, -- for autocompletion
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	-- auto closing
	{ "windwp/nvim-autopairs" }, -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag" }, -- autoclose tags

	-- closing tags highlight --
	{ "andymass/vim-matchup" },

	-- css colors --
	{ "norcalli/nvim-colorizer.lua" },

	-- formatting & linting
	{
		"creativenull/efmls-configs-nvim",
		-- version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
	},

	-- better syntaxis highlight --
	{ "sheerun/vim-polyglot" },

	-- git --
	{ "https://github.com/tpope/vim-fugitive" },
}

require("lazy").setup(plugins, {
	ui = {
		border = "rounded",
	},
})
