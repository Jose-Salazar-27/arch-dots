return {
  enabled = false,
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    ensure_installed = {
      "go",
      "bash",
      "nodejs",
    },
  },
}
