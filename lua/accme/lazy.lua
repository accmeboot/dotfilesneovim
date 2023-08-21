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
	{ "nvim-lua/plenary.nvim" },
	{ "https://github.com/echasnovski/mini.indentscope" }, -- animated highilting the current code selection
	{ "lukas-reineke/indent-blankline.nvim" }, -- indent lines
	{ "https://github.com/morhetz/gruvbox" },
	-- themes --
	{ "https://github.com/sainnhe/gruvbox-material" },
	{ "https://github.com/sainnhe/gruvbox-material" },
	{ "https://github.com/ray-x/starry.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rktjmp/lush.nvim" },
	{ "briones-gabriel/darcula-solid.nvim", dependencies = { "rktjmp/lush.nvim" } },

	{ "christoomey/vim-tmux-navigator" }, -- navigation between split windows via ctrl + h/j/k/l

	{ "numToStr/Comment.nvim" }, -- comment out on gc
	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- better comenting

	{ "nvim-tree/nvim-web-devicons" },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	-- Floating cmdline
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
	},

	-- statusline
	{ "nvim-lualine/lualine.nvim" },

	--telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim" },

	-- autocomplition
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- snippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

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
	{ "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
	{ "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

	-- golang --
	{ "ray-x/go.nvim" },
	{ "ray-x/guihua.lua" }, -- recommanded if need floating window support

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
