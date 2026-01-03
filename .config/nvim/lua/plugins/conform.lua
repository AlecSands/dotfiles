return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- This triggers the "on save"
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			["_"] = { "prettierd" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
