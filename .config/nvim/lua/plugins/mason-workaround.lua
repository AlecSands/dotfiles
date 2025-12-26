return {
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "black")
    end,
  },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
