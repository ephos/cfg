-- Use space-pv to enter netrw 
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pb", vim.cmd.Vex)

-- Change Nvim copy paste to use system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

-- Update "d" so deletion is not saved to register
vim.keymap.set("n", "d", '"_d')

-- Disable recording
vim.keymap.set("n", "q", "<nop>")
