return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "javascript", "typescript", "tsx" },
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		-- Try to setup if the module exists
		local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
		if status_ok then
			treesitter_configs.setup(opts)
		end

		-- Manually start treesitter highlighting and set up folding
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua", "markdown" },
			callback = function()
				-- Explicitly start treesitter
				vim.treesitter.start()
			end,
		})
	end,
}
