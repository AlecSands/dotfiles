vim.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true
vim.o.winborder = "rounded"

vim.cmd.colorscheme("tokyonight-night")

-- Set up folding
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
