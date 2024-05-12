-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "intelephense", "tsserver", "rust_analyzer" },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
    lua_ls = function()
        local lua_opts = lsp_zero.nvim_lua_ls()
        require("lspconfig").lua_ls.setup(lua_opts)
    end,
})

lsp.configure("yamlls", {
    on_attach = function(_, _)
        vim.keymap.set("n", "<leader>f", "<cmd>!yq -iP %<CR>")
    end,
})

lsp.configure("ocamllsp", {
    on_attach = function(_, bufnr)
        if string.match(vim.api.nvim_buf_get_name(bufnr), ".re") then
            vim.keymap.set("n", "<leader>f", "<cmd>!refmt --in-place %<CR>")
        end
    end,
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
