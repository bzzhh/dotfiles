local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

local server_name = "ligo_ls"
local cmd = { "ligo", "lsp" }
local root_files = {
    "esy.json",
}

configs[server_name] = {
    default_config = {
        cmd = cmd,
        filetypes = { "jsligo", "mligo" },
        root_dir = util.root_pattern(root_files),
        init_options = {
            ligoLanguageServer = {
                loggingVerbosity = "error",
            },
        },
    },
}

configs[server_name].setup {}
