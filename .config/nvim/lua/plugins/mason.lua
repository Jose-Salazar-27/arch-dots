return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function(_, opts)
      -- require("mason").setup(opts)
      local mason = require("mason")
      local mason_lsp = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },
        max_concurrent_installers = 10,
      })

      mason_lsp.setup({
        -- ensure_installed = {
        --   "gopls",
        --   "lua-language-server",
        --   "typescript-language-server",
        --   "eslint-lsp",
        --   "hyprls",
        --   "docker-compose-language-service",
        --   "dockerfile-language-server",
        --   "yaml-language-server",
        --   "gh-actions-language-server",
        --   "json-lsp",
        --   "bash-language-server",
        -- },
        -- automatic_installation = false,
      })

      mason_tool_installer.setup({
        ensure_installed = {
          --langs
          "gopls",
          "lua-language-server",
          "typescript-language-server",
          "eslint-lsp",
          "hyprls",
          "docker-compose-language-service",
          "dockerfile-language-server",
          "yaml-language-server",
          "gh-actions-language-server",
          "json-lsp",
          "bash-language-server",
          -- linters and formatters
          "gofumpt",
          "goimports",
          "delve",
          "prettier",
          "eslint_d",
          "golangci-lint",
          "stylua",
          "shellcheck",
          "beautysh",
          "hadolint",
          "yamlfix",
        },
      })
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   opts = require("plugins.configs.mason"),
  --   dependencies = { "williamboman/mason.nvim" },
  --   cmd = {
  --     "MasonToolsInstall",
  --     "MasonToolsInstallSync",
  --     "MasonToolsUpdate",
  --     "MasonToolsUpdateSync",
  --     "MasonToolsClean",
  --   },
  -- },
}
