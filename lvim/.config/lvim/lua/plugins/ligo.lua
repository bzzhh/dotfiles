local M = { "~/code/ligo/tools/vim/ligo/start/ligo" }
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

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

require("lspconfig").ligolang.setup{opts}
return M
