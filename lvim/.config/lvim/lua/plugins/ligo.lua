local M = {}

M.config = function()
	local configs = require("lspconfig.configs")
	local util = require("lspconfig.util")
	local ft = require("Comment.ft")

	ft({ "ligo", "mligo" }, { "//%s" })

	configs.ligolang = {
		default_config = {
			cmd = { "ligo-squirrel" },
			filetypes = { "ligo", "mligo", "religo" },
			root_dir = util.find_git_ancestor,
		},
		docs = {
			description = [[
  https://gitlab.com/ligolang/ligo/-/tree/dev/tools/lsp
  A language server for all three dialects of LIGO.
  ]],
		},
	}

	local opts = {
		-- on_attach = require("user.lsp.handlers").on_attach,
		-- capabilities = require("user.lsp.handlers").capabilities,
	}

	require("lspconfig").ligolang.setup({ opts })
end

return M
