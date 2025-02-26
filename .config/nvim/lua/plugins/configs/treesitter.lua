return {
  ensure_installed = {
    "go",
    "lua",
    "pkl",
    "rust",
    "gleam",
    "templ",
    "hyprlang",
    "vim",
    "vimdoc",
    "python",
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
}
