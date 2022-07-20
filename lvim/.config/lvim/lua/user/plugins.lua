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
    }
end

return M
