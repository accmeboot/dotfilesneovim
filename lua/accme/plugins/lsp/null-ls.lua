-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"css",
				"scss",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
				"md",
				"txt",
			},
			only_local = "node_modules/.bin",
		}), -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.black.with({
			prefer_local = "venv/bin",
		}), -- python formatter
		diagnostics.flake8.with({
			prefer_local = "venv/bin",
		}), -- python linter. Alternatives: mypy, pylint
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
			condition = function(utils)
				if utils.root_has_file(".eslintrc.js") then
					return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
				end
				if utils.root_has_file(".eslintrc") then
					return utils.root_has_file(".eslintrc") -- change file extension if you use something else
				end
				if utils.root_has_file(".eslintrc.json") then
					return utils.root_has_file(".eslintrc.json") -- change file extension if you use something else
				end
				if utils.root_has_file("./app/.eslintrc.js") then
					return utils.root_has_file("./app/.eslintrc.js")
				end
				if utils.root_has_file(".eslintrc.cjs") then
					return utils.root_has_file(".eslintrc.cjs")
				end
			end,
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
