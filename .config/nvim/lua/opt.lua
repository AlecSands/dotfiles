vim.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true
vim.o.winborder = "rounded"

vim.cmd.colorscheme("tokyonight-night")

-- Set up folding
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

local colors = {
	light_gray = "#3b4261",
	light_gray_2 = "#586393",
	dark_gray = "#16161e",
}

vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.light_gray })
vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.dark_gray, bg = colors.light_gray_2, bold = true })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.dark_gray, bg = colors.light_gray, bold = true })
