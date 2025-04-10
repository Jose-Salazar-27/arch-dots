return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript = { { "prettierd", "prettier", stop_after_first = true } },
      typescript = { { "prettierd", "prettier", stop_after_first = true } },
      javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
      typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
      json = { { "prettierd", "prettier", stop_after_first = true } },
      bash = { "beautysh" },
      yaml = { "yamlfix" },
      css = { { "prettierd", "prettier", stop_after_first = true } },
      scss = { { "prettierd", "prettier", stop_after_first = true } },
      sh = { "shellcheck" },
      go = { "goimports", "gofmt" },
      lua = { "stylua" },
    },
    default_format_opts = {
      lsp_format = "fallback",
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    },
  },
}
