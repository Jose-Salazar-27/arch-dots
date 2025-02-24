return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
    -- Asegúrate de que inccommand esté configurado
    vim.cmd("set inccommand=split")
  end,
  -- keys = {
  --   {
  --     "<leader>rn",
  --     function()
  --       vim.cmd("wa") -- Guarda todos los buffers
  --       return ":IncRename " .. vim.fn.expand("<cword>")
  --     end,
  --     { expr = true, noremap = true, silent = true, desc = "Save and rename with current word" },
  --   },
  -- },
}
