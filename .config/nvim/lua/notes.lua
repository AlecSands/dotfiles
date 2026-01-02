-- Open notes
vim.keymap.set("n", "<leader>no", "<cmd>e ~/Code/notes.md<CR>")
-- Open notes over buffer
local buf = vim.api.nvim_create_buf(false, false)
local filepath = vim.fn.expand("~/Code/notes.md")

vim.api.nvim_buf_call(buf, function()
	vim.cmd(string.format("e %s", vim.fn.fnameescape(filepath)))
end)

local open_buf = function()
	local width = math.floor(vim.o.columns / 1.5)
	local height = math.floor(vim.o.lines / 1.5)
	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}
	vim.api.nvim_open_win(buf, true, win_opts)
end

vim.keymap.set("n", "<leader>nO", open_buf)
