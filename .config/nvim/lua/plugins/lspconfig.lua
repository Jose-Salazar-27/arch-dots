return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
      local on_attach = require("plugins.configs.lspconfig-nvc").on_attach

      vim.diagnostic.config({
        virtual_text = true,
      })

      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "different-requires" },
            },
          },
        },
      })

      vim.lsp.config("bashls", {
        filetypes = { "sh", "zsh" },
      })

      vim.lsp.config("rust_analyzer", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "rust" },
        root_dir = vim.fs.root(0, { "Cargo.toml" }),
        settings = {
          ["rust_analyzer"] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
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

      vim.lsp.config("tailwindcss", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          includeLanguages = {
            templ = "html",
          },
        },
      })

      vim.lsp.config("eslint", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("templ", {})

      vim.lsp.config("tsserver", {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      })

      vim.lsp.config("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "python" },
      })

      vim.lsp.config("yamlls", {
        filetypes = { "yaml", "yaml.docker-compose" },
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            format = { enable = false },
            validate = false,
            hover = true,
            schemaStore = {
              enable = true,
              url = "https://json.schemastore.org/v1/schema.json",
            },
            schemas = {
              kubernetes = "*.{yml,yaml}",
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
              ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
              ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
              ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
              ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
            },
          },
        },
      })

      vim.lsp.config("dockerls", {
        capabilities = capabilities,
      })

      vim.lsp.config("docker_compose_language_service", {
        capabilities = capabilities,
      })

      vim.lsp.config("gh_actions_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "bashls",
        "rust_analyzer",
        "gopls",
        "tailwindcss",
        "eslint",
        "templ",
        "tsserver",
        "pyright",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "gh_actions_ls",
      })
    end,
  },
}
