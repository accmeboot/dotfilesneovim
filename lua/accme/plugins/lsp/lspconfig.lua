-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local lspconfigui_status, lspconfigui = pcall(require, "lspconfig.ui.windows")
if not lspconfigui_status then
	return
end

local lsputil_status, lsputil = pcall(require, "lspconfig/util")
if not lsputil_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript-tools")
if not typescript_setup then
	return
end

-- setting app border for all floating windows
lspconfigui.default_options = { border = "rounded" }

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- go to definition
	keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- show definition
	keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- show references
	keymap.set("n", "<leader>C", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- show references
	keymap.set("v", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- rename everywhere
	keymap.set("n", "gr", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- show diagnostic
	keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>am", ":TSToolsAddMissingImports<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- rust --
vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = on_attach,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				diagnostics = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
	-- DAP configuration
	dap = {},
}

-- -- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetype = { "html", "tmpl", "gotmpl" },
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function(fname)
		return lsputil.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
			or lsputil.path.dirname(fname)
	end,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls", "--remote=auto" },
})

lspconfig["sqlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = function(fname)
			return lsputil.root_pattern(".git")(fname) or lsputil.path.dirname(fname)
		end,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

lspconfig["svelte"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		-- prefix = " ",
		prefix = "",
		spacing = 4,
	},
})
