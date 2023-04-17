require "user.lsp.languages.rust"
require "user.lsp.languages.go"
require "user.lsp.languages.python"
require "user.lsp.languages.js-ts"
require "user.lsp.languages.sh"
require "user.lsp.languages.emmet"

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
  { command = "prettier", filetypes = { "css" } },
}
