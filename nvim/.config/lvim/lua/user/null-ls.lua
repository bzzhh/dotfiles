local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
  },
  {
    command = "prettierd",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
  },
  {
    command = "markdownlint",
    filetypes = { "markdown", "mdx" }
  }
}
