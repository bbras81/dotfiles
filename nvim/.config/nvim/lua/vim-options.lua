vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.wo.number = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Melhor navegação entre janelas
local map = vim.keymap.set
map("n", "<C-k>", ":wincmd k <CR>")
map("n", "<C-j>", ":wincmd j <CR>")
map("n", "<C-h>", ":wincmd h <CR>")
map("n", "<C-l>", ":wincmd l <CR>")
map("n", "<leader>h", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Mover linha para cima/baixo com Alt+j e Alt+k
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
