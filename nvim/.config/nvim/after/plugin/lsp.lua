-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'intelephense',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.configure('yamlls', {
    on_attach = function(_, _)
        vim.keymap.set("n", "<leader>f", '<cmd>!yq -iP %<CR>')
    end
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
