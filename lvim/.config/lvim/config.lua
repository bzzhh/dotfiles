-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "zenburn"
vim.opt.wrap = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = false

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
require("format.black")
require("format.gofumpt")
require("format.golines")
require("format.markdownlint")
require("format.phpcsfixer")
require("format.prettierd")
require("format.rustfmt")
require("format.stylua")

--Linters
require("lint.eslint_d")
require("lint.flake8")
require("lint.markdownlint")
require("lint.selene")

--LSP
require("lsp-config.general")
require("lsp-config.tailwindcss")

-- Additional Plugins
lvim.plugins = {
	require("plugins.colorizer"),
	require("plugins.editorconfig"),
	require("plugins.lsp_signature"),
	require("plugins.markdown_preview"),
	require("plugins.neoscroll"),
	require("plugins.rescript"),
	require("plugins.todo_comments"),
	require("plugins.trouble"),
	require("plugins.vim_matchup"),
	require("plugins.vim_twig"),
	require("plugins.zenburn"),
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufNewFile,BufRead", "*.pcss", "set filetype=css" },
}
