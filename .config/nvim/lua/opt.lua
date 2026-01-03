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

local yank_diagnostics = function()
	local buff_name = vim.fn.bufname("")
	local buff_numb = vim.fn.bufnr(buff_name)
	local line_numb = vim.fn.line(".") - 1
	local diagnostics = vim.diagnostic.get(buff_numb, { lnum = line_numb })
	local val = ""
	for _, diagnostic in ipairs(diagnostics) do
		local severityName = ""
		if diagnostic.severity == vim.diagnostic.severity.ERROR then
			severityName = "Error"
		elseif diagnostic.severity == vim.diagnostic.severity.WARN then
			severityName = "Warning"
		elseif diagnostic.severity == vim.diagnostic.severity.INFO then
			severityName = "Info"
		elseif diagnostic.severity == vim.diagnostic.severity.HINT then
			severityName = "Hint"
		end
		val = string.format(
			"%s%s: %s [%s] %s\n",
			val,
			severityName,
			diagnostic.message,
			diagnostic.code,
			diagnostic.source
		)
	end
	vim.fn.setreg("+", val)
end

vim.keymap.set("n", "<leader>dy", yank_diagnostics)
