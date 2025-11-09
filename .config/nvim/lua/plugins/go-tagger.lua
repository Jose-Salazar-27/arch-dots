return {
  "romus204/go-tagger.nvim",
  ft = "go",
  cmd = { "AddGoTags", "RemoveGoTags" },
  config = function()
    require("go-tagger").setup({
      -- Skip unexported fields (starting with lowercase)
      skip_private = true,
    })
    vim.keymap.set("v", "<leader>gta", ":AddGoTags<CR>", { desc = "Add Go struct tags", silent = true })
    vim.keymap.set("v", "<leader>gtr", ":RemoveGoTags<CR>", { desc = "Remove Go struct tags", silent = true })
  end,
}
