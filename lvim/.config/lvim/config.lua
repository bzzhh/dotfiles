-- general
lvim.colorscheme = "zenburn"
lvim.log.level = "warn"
lvim.format_on_save = false
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

-- Language Specific
require("user.nls").config()

--LSP
require("user.lsp-config.general")
require("user.lsp-config.tailwindcss")
require("user.lsp-config.ligolang")

-- Additional Plugins
require("user.plugins").config()

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufNewFile,BufRead", "*.pcss", "set filetype=css" },
}
