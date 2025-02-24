return {
  ensure_installed = {
    "gofumpt",
    "goimports",
    "gopls",
    "delve",
    "lua-language-server",
    "typescript-language-server",
    "eslint-lsp",
    "prettier",
    "hyprls",
  },

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,
}
