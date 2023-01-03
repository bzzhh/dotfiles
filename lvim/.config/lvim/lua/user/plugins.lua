local M = {}

M.config = function()
	vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

	lvim.plugins = {
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("user.colorizer").config()
			end,
			event = "BufRead",
		},
		{ "sainnhe/gruvbox-material" },
		{ "towolf/vim-helm" },
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
		{ "earthly/earthly.vim" },
		{ "petobens/poet-v" },
		{
			"NTBBloodbath/rest.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("rest-nvim").setup({
					-- Open request results in a horizontal split
					result_split_horizontal = false,
					-- Keep the http file buffer above|left when split horizontal|vertical
					result_split_in_place = false,
					-- Skip SSL verification, useful for unknown certificates
					skip_ssl_verification = false,
					-- Highlight request on run
					highlight = {
						enabled = true,
						timeout = 150,
					},
					result = {
						-- toggle showing URL, HTTP info, headers at top the of result window
						show_url = true,
						show_http_info = true,
						show_headers = true,
					},
					-- Jump to request line on run
					jump_to_request = false,
					env_file = ".env",
					custom_dynamic_variables = {},
					yank_dry_run = true,
				})
			end,
		},
		{
			"simrat39/rust-tools.nvim",
			config = function()
				local status_ok, rust_tools = pcall(require, "rust-tools")
				if not status_ok then
					return
				end

				local opts = {
					tools = {
						executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
						reload_workspace_from_cargo_toml = true,
						inlay_hints = {
							auto = true,
							only_current_line = false,
							show_parameter_hints = true,
							parameter_hints_prefix = "<-",
							other_hints_prefix = "=>",
							max_len_align = false,
							max_len_align_padding = 1,
							right_align = false,
							right_align_padding = 7,
							highlight = "Comment",
						},
						hover_actions = {
							--border = {
							--        { "╭", "FloatBorder" },
							--        { "─", "FloatBorder" },
							--        { "╮", "FloatBorder" },
							--        { "│", "FloatBorder" },
							--        { "╯", "FloatBorder" },
							--        { "─", "FloatBorder" },
							--        { "╰", "FloatBorder" },
							--        { "│", "FloatBorder" },
							--},
							auto_focus = true,
						},
					},
					server = {
						on_attach = require("lvim.lsp").common_on_attach,
						on_init = require("lvim.lsp").common_on_init,
						settings = {
							["rust-analyzer"] = {
								checkOnSave = {
									command = "clippy",
								},
							},
						},
					},
				}
				--local extension_path = vim.fn.expand "~/" .. ".vscode/extensions/vadimcn.vscode-lldb-1.7.3/"

				--local codelldb_path = extension_path .. "adapter/codelldb"
				--local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

				--opts.dap = {
				--        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				--}
				rust_tools.setup(opts)
			end,
			ft = { "rust", "rs" },
		},
	}
end

return M
