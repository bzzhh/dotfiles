local M = {}

local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

local server_name = "archetype"

configs[server_name] = {
	default_config = {
		cmd = { "archetype" },
		root_dir = util.find_git_ancestor,
		filetypes = { "archetype" },
	},
}

local opts = {
  on_attach = require("lvim.lsp").common_on_attach,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
}

require("lvim.lsp.manager").setup(server_name, opts)

return M
