-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "zenburn"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
lvim.lsp.on_attach_callback = function(client, _)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

-- formatters.setup {
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  { exe = "prettier", filetypes = {
    "htmldjango.twig",
    "javascript",
    "javascriptreact",
    "php",
    "typescript",
    "typescriptreact",
  } },
  { exe = "markdownlint", filetypes = { "markdown" } },
  { exe = "gofumpt", filetypes = { "go" } },
  { exe = "golines", filetypes = { "go" } },
  { exe = "phpcsfixer", filetypes = { "php" } },
  { exe = "black", filetypes = { "python" } },
})

-- linters.setup {
local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  { exe = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
  { exe = "markdownlint", filetypes = { "markdown" } },
  { exe = "flake8", filetypes = { "python" } },
})

-- Additional Plugins
lvim.plugins = {
    {"jnurmine/Zenburn"},
    {"lumiliet/vim-twig"},
    {"purescript-contrib/purescript-vim"},
    {"rescript-lang/vim-rescript"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    {
      event = "BufRead",
     "editorconfig/editorconfig-vim",
    },
    {"~/code/ligo/tools/vim/ligo/start/ligo"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufNewFile,BufRead", "*.pcss", "set filetype=css" }
}
