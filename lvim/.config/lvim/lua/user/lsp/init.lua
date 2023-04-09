require "user.lsp.languages.rust"
require "user.lsp.languages.go"
require "user.lsp.languages.python"
require "user.lsp.languages.js-ts"
require "user.lsp.languages.sh"
require "user.lsp.languages.emmet"

lvim.lsp.diagnostics.virtual_text = false

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
  { command = "prettier", filetypes = { "css" } },
}

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }
