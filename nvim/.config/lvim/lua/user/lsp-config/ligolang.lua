local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

local server_name = "ligo_ls"
local cmd = { "ligo", "lsp" }
local root_files = {
    "esy.json",
}

if not configs[server_name] then
    configs[server_name] = {
        default_config = {
            cmd = cmd,
            filetypes = { "jsligo", "ligo", "mligo" },
            root_dir = function(fname)
                return util.root_pattern(unpack(root_files))(fname) or
                util.find_git_ancestor(fname)
            end,
            init_options = {
                ligoLanguageServer = {
                    loggingVerbosity = "error",
                },
            },
        },
        docs = {
            description = [[
    [LIGO Language Server](https://gitlab.com/ligolang/ligo/-/blob/dev/tools/vim/ligo/start/ligo/README.md)
    First, install ligo following [this tutorial](https://ligolang.org/docs/intro/installation)
    Then enable ligo language server in your lua configuration.
    ```lua
    require'lspconfig'.ligo_ls.setup{}
    ```
    ]],
            default_config = {
                root_dir = [[root_pattern(".ligoproject", ".git")]],
            },
        },
    }
end

configs[server_name].setup({})
