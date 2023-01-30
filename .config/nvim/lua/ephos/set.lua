-- Core Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50

-- Lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Visual Indictaor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "#00ffc8"})

-- Tabbin' Yo
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line Length Indictaor
vim.opt.colorcolumn = "80"

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- Terminal
vim.opt.termguicolors = true

-- Scrolling/History
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

