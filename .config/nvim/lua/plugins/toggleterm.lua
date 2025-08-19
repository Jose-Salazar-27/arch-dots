return {
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    -- build = ":ToggleTerm",
    keys = { { "<F4>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
    -- opts = {
    --   open_mapping = [[<F4>]],
    --   direction = "floating",
    --   shade_filetypes = {},
    --   hide_numbers = true,
    --   insert_mappings = true,
    --   terminal_mappings = true,
    --   start_in_insert = true,
    --   close_on_exit = true,
    -- },
    config = function()
      require("toggleterm").setup({
        hide_numbers = false,
        insert_mappings = false,
        shade_terminals = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = "zsh",
        float_opts = {
          border = "curved",
          winblend = 3,
          highlights = {
            border = "Normal",
            -- background = "Normal",
          },
        },
      })
    end,
  },
}
