-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
vim.opt.wrap = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
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

-- Formatters
require("user.format.black")
require("user.format.gofumpt")
require("user.format.golines")
require("user.format.markdownlint")
require("user.format.phpcsfixer")
require("user.format.prettierd")
require("user.format.rustfmt")
require("user.format.stylua")

--Linters
require("user.lint.eslint_d")
require("user.lint.flake8")
require("user.lint.markdownlint")
require("user.lint.selene")

--LSP
require("user.lsp-config.general")
require("user.lsp-config.tailwindcss")

-- Additional Plugins
lvim.plugins = {
	require("user.plugins.colorizer"),
	require("user.plugins.editorconfig"),
	require("user.plugins.lsp_signature"),
	require("user.plugins.markdown_preview"),
	require("user.plugins.neoscroll"),
	require("user.plugins.rescript"),
	require("user.plugins.todo_comments"),
	require("user.plugins.trouble"),
	require("user.plugins.vim_matchup"),
	require("user.plugins.vim_twig"),
	require("user.plugins.colorsheme"),
	require("user.plugins.ligolang"),
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufNewFile,BufRead", "*.pcss", "set filetype=css" },
}
