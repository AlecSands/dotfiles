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
