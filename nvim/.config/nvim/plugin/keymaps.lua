local set = vim.keymap.set

set("n", "<leader>w", ":w<CR>")
set("n", "<leader>c", "<cmd>bdelete<CR>")
-- set('n', '<leader>c', ':close<CR>')
set("n", "<leader>q", ":q<CR>")
set("n", "<leader>sx", vim.cmd.Ex)

-- Keymaps for better default experience
-- See `:help set()`
set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selections
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '>-2<CR>gv=gv")

-- Keep cursor in place when merging lines
set("n", "J", "mzJ`z")

-- Center the cursor
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set("n", "<S-l>", ":BufferLineCycleNext<CR>")
set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

set("n", "<leader>u", vim.cmd.UndotreeToggle)
set("n", "<leader>gs", vim.cmd.Git)
