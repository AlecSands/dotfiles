vim.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true
vim.o.winborder = "rounded"

vim.cmd.colorscheme("tokyonight-night")

-- Set up folding
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Open notes
vim.keymap.set("n", "<leader>no", "<cmd>e ~/Code/notes.md<CR>")
-- Open notes over buffer
local width = vim.o.columns / 1.5
local height = vim.o.lines / 1.5
local win_opts = {
	relative = "editor",
	width = width,
	height = height,
	col = (vim.o.columns - width) / 2,
	row = (vim.o.lines - height) / 2,
	style = "minimal",
	border = "rounded",
}
local buf = vim.api.nvim_create_buf(false, false)
local filepath = vim.fn.expand("~/Code/notes.md")

vim.api.nvim_buf_call(buf, function()
	vim.cmd(string.format("e %s", vim.fn.fnameescape(filepath)))
end)

local open_buf = function()
	vim.api.nvim_open_win(buf, true, win_opts)
end

vim.keymap.set("n", "<leader>nO", open_buf)

-- Open docs
local filetypeMatch = function()
	local bufferNum = vim._resolve_bufnr()
	local matchStr = vim.filetype.match({ buf = bufferNum })
	vim.print(string.format("match string: %s", matchStr))

	local url = ""
	if matchStr == "lua" then
		url = "https://www.lua.org/docs.html"
	elseif matchStr == "javascript" then
		url = "https://developer.mozilla.org/en-US/docs/Web/JavaScript"
	elseif matchStr == "javascriptreact" then
		url = "https://react.dev/reference/react"
	end

	if url ~= "" then
		os.execute(string.format("xdg-open %s", url))
	end
end
vim.keymap.set("n", "<leader>do", filetypeMatch)

-- Open to README when no arguments
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
			local readme = vim.fn.findfile("README.md", ".;")
			if readme ~= "" then
				vim.cmd(string.format("e %s", readme))
			end
		end
	end,
})
