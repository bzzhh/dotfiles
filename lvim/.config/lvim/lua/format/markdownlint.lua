local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({ { exe = "markdownlint", filetypes = { "markdown" } } })
