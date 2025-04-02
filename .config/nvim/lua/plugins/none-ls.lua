return {
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    opts = function()
      return require("plugins.configs.null-ls")
    end,
  },
}
