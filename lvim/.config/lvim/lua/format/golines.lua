local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({ { exe = "golines", filetypes = { "go" } } })
