local M = {}

M.config = function()
	lvim.plugins = {
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("user.colorizer").config()
			end,
			event = "BufRead",
		},
		{ "sainnhe/gruvbox-material" },
		{ "editorconfig/editorconfig-vim" },
		{
			"ray-x/lsp_signature.nvim",
			config = function()
				require("lsp_signature").on_attach()
			end,
			event = "InsertEnter",
		},
		{
			"iamcco/markdown-preview.nvim",
			run = "cd app && yarn install",
		},
		{
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		},
		{ "rescript-lang/vim-rescript" },
		{ "jez/vim-better-sml" },
		{
			"folke/todo-comments.nvim",
			event = "BufRead",
			config = function()
				require("todo-comments").setup()
			end,
		},
		{
			"folke/trouble.nvim",
			cmd = "TroubleToggle",
		},
		{
			"andymass/vim-matchup",
			event = "CursorMoved",
			config = function()
				vim.g.matchup_matchparen_offscreen = { method = "popup" }
			end,
		},
		{ "reasonml-editor/vim-reason-plus" },
		{ "lumiliet/vim-twig" },
		{ "ocaml/vim-ocaml" },
		{ "pbrisbin/vim-mkdir" },
	}
end

return M
