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
	elseif matchStr == "markdown" then
		url = "https://www.markdownguide.org/"
	end

	if url ~= "" then
		os.execute(string.format("xdg-open %s", url))
	end
end
vim.keymap.set("n", "<leader>do", filetypeMatch)
