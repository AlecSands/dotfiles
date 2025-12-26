--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- local builtin = require("telescope.builtin")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fh",
      function()
        return require("telescope.builtin").help_tags()
      end,
      desc = "Find help tags",
    },
  },
}
