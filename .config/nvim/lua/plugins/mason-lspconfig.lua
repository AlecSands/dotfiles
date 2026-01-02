return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				"lazy.nvim",
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	-- NEW: nvim-cmp configuration
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "folke/lazydev.nvim" },
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				-- group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
			table.insert(opts.sources, { name = "nvim_lsp" })
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})

			-- NEW: Check if vim.lsp.config exists (Neovim 0.11+)
			-- Otherwise fall back to the old way for older versions
			if vim.lsp.config then
				vim.lsp.config("lua_ls", {})
			else
				require("lspconfig").lua_ls.setup({})
			end

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		end,
	},
}
