local handle_golangcilint_version = function()
  if string.find(vim.fn.system({ "golangci-lint", "version" }), "version v2") then
    return {
      "run",
      "--output.json.path=stdout",
      "--issues-exit-code=0",
      "--show-stats=false",
      function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      end,
    }
  else
    return {
      "run",
      "--out-format",
      "json",
      "--issues-exit-code=0",
      "--show-stats=false",
      "--print-issued-lines=false",
      "--print-linter-name=false",
      function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      end,
    }
  end
end

return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      go = { "golangcilint" },
      lua = { "stylua" },
      dockerfile = { "hadolint" },
    }

    -- read at: https://github.com/mfussenegger/nvim-lint/issues/760#issuecomment-2758985229
    local golang_linter = lint.linters.golangcilint
    golang_linter.args = handle_golangcilint_version()

    -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      -- group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>tl", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
