return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files()
		end)
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", "<leader>fh", function()
			builtin.help_tags()
		end)
	end,
}
