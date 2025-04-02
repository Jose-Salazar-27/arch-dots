-- maps are automatically loaded on the VeryLazy event
-- Default maps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional maps here

local map = vim.keymap.set

-- map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" }) -- move to the beginning of the line
map("i", "<C-e>", "<End>", { desc = "Move End of line" })

map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("n", "<leader>rn", ":IncRename ")

map("n", "<leader>fm", function()
  require("conform").format({ async = true })
  vim.notify("Manual format was executed", "info", { title = "Conform.nvim" })
end, { desc = "Format buffer" })
