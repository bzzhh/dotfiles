local lsp_zero = require('lsp-zero')

local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

local server_name = "ligo_ls"
local cmd = { "ligo", "lsp" }
local root_files = {
    "ligo.json",
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

lsp_zero.extend_lspconfig()
configs[server_name].setup {}
