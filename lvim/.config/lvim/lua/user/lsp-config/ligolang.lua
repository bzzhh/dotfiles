local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

local server_name = "ligo-squirrel"

configs[server_name] = {
    default_config = {
        cmd = { "ligo-squirrel" },
        root_dir = util.root_pattern(".ligoproject"),
        filetypes = { "CameLIGO", "JsLIGO", "PascaLIGO" },
    },
}

local opts = {
    cmd = { "ligo-squirrel" },
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
}

require("lvim.lsp.manager").setup(server_name, opts)
