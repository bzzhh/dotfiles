local M = {}

M.config = function()
	-- NOTE: By default, all null-ls providers are checked on startup.
	-- If you want to avoid that or want to only set up the provider
	-- when you opening the associated file-type,
	-- then you can use filetype plugins for this purpose.
	-- https://www.lunarvim.org/languages/#lazy-loading-the-formatter-setup
	local status_ok, nls = pcall(require, "null-ls")
	if not status_ok then
		return
	end

	nls.setup({
		on_attach = require("lvim.lsp").common_on_attach,
		debounce = 150,
		save_after_format = false,
		sources = {
			nls.builtins.formatting.prettierd.with({
				condition = function(utils)
					return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
				end,
				prefer_local = "node_modules/.bin",
			}),
			nls.builtins.formatting.eslint_d.with({
				condition = function(utils)
					return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
				end,
				prefer_local = "node_modules/.bin",
			}),
			nls.builtins.formatting.stylua,
			nls.builtins.formatting.black.with({ extra_args = { "--fast" }, filetypes = { "python" } }),
			nls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" }, filetypes = { "python" } }),
			-- nls.builtins.formatting.markdownlint.with({
			-- 	filetypes = { "markdown" },
			-- }),
			nls.builtins.diagnostics.shellcheck,
			nls.builtins.diagnostics.luacheck,
			-- nls.builtins.diagnostics.markdownlint.with({
			-- 	filetypes = { "markdown" },
			-- }),
			nls.builtins.diagnostics.golangci_lint.with({
				condition = function(utils)
					return utils.root_has_file(".golangci.yml")
				end,
			}),
			nls.builtins.code_actions.eslint_d.with({
				condition = function(utils)
					return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
				end,
				prefer_local = "node_modules/.bin",
			}),
		},
	})
end

return M
