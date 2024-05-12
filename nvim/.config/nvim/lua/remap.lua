vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>bdelete<CR>')
-- vim.keymap.set('n', '<leader>c', ':close<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>sx', vim.cmd.Ex)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true })

-- Move selections
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- Keep cursor in place when merging lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- Center the cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Comment
vim.keymap.set('n', '<leader>/',
    "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")

vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>')
