return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      "apple/pkl-neovim",
      "windwp/nvim-ts-autotag",
      --"vrischmann/tree-sitter-templ",
    },
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gotmpl",
        "lua",
        "pkl",
        "rust",
        "gleam",
        "templ",
        "hyprlang",
        "vim",
        "vimdoc",
        "python",
        "dockerfile",
        "bash",
        "json",
        "yaml",
        "typescript",
        "javascript",
        "tsx",
        "css",
        "make",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml" },
      },
    },
    -- config = function(_, opts)
    --   require("nvim-treesitter.config").setup(opts)
    -- end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        aliases = {
          ["template"] = "html",
        },
      })
    end,
  },
}
