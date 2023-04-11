-- Additional Plugins
lvim.plugins = {
  "sainnhe/gruvbox-material",
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "NvChad/nvim-colorizer.lua",
  "folke/todo-comments.nvim",
  "pbrisbin/vim-mkdir",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
  --       }
  --     end, 100)
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup {
  --       formatters = {
  --         insert_text = require("copilot_cmp.format").remove_existing,
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "dense-analysis/neural",
  --   config = function()
  --     require("neural").setup {
  --       source = {
  --         openai = {
  --           api_key = os.getenv "OPENAI_API_KEY",
  --         },
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "muniftanjim/nui.nvim",
  --     "elpiloto/significant.nvim",
  --   },
  -- },
}
