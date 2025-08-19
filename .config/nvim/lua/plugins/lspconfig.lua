return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    lazy = false,
    opts = {
      ---@class PluginLspOpts
      inlay_hints = { enabled = true },
      codelens = {
        enabled = true,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
      -- local capabilities = require("blink.cmp").get_lsp_capabilities()
      local on_attach = require("plugins.configs.lspconfig-nvc").on_attach
      local util = require("lspconfig/util")

      vim.diagnostic.config({
        -- virtual_lines = true,
        virtual_text = true,
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "different-requires" },
            },
          },
        },
      })

      lspconfig.bashls.setup({
        filetypes = { "sh", "zsh" },
      })

      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "rust" },
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
          ["rust_analyzer"] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      })

      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            semanticTokens = true,
            completeUnimported = true,
            usePlaceholders = false,
            analyses = {
              unusedparams = true,
              unreachable = true,
              unmarshal = true,
            },
          },
        },
      })

      lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          includeLanguages = {
            templ = "html",
          },
        },
      })

      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig.templ.setup({})

      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      })

      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "python" },
      })

      lspconfig.yamlls.setup({
        filetypes = { "yaml", "yaml.docker-compose" },
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
              url = "https://json.schemastore.org/v1/schema.json",
            },
          },
        },
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })

      lspconfig.gh_actions_ls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
