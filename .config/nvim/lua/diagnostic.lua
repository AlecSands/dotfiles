local get_severity_name = function(severity_enum)
	local severity_name = ""
	if severity_enum == vim.diagnostic.severity.ERROR then
		severity_name = "Error"
	elseif severity_enum == vim.diagnostic.severity.WARN then
		severity_name = "Warning"
	elseif severity_enum == vim.diagnostic.severity.INFO then
		severity_name = "Info"
	elseif severity_enum == vim.diagnostic.severity.HINT then
		severity_name = "Hint"
	end
	return severity_name
end

local yank_diagnostics = function()
	local buff_name = vim.fn.bufname("")
	local buff_numb = vim.fn.bufnr(buff_name)
	local line_numb = vim.fn.line(".") - 1
	local diagnostics = vim.diagnostic.get(buff_numb, { lnum = line_numb })
	local diagnostic_string = ""
	for _, diagnostic in ipairs(diagnostics) do
		local severity_name = get_severity_name(diagnostic.severity)
		diagnostic_string = string.format(
			"%s%s: %s [%s] %s\n",
			diagnostic_string,
			severity_name,
			diagnostic.message,
			diagnostic.code,
			diagnostic.source
		)
	end
	vim.fn.setreg("+", diagnostic_string)
end

vim.keymap.set("n", "<leader>dy", yank_diagnostics)
