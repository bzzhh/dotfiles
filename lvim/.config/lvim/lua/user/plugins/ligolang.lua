local M = {}

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

require("lspconfig").ligolang.setup({})

local status_ok, ft = pcall(require, "Comment.ft")
if not status_ok then
	return
end

ft({ "ligo", "mligo" }, { "(*%s*)" })

return M
