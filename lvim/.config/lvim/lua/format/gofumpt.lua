local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({ { exe = "gofumpt", filetypes = { "go" } } })
