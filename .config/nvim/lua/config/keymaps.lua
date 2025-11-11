-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

-- Go to the beginning or end of the line
map({ "v" }, "H", "^i", { desc = "Move Beginning of line" })
map({ "v" }, "L", "<End>", { desc = "Move End of line" })

-- Move along the buffer in insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Lsp rename
map("n", "<leader>rn", ":IncRename ")

-- Call formatter manually
map("n", "<leader>fm", function()
  require("conform").format({ async = true })
  vim.notify("Manual format was executed", "info", { title = "Conform.nvim" })
end, { desc = "Format buffer" })

-- Floating term handling
map(
  "n",
  "<leader>tt",
  ":ToggleTerm direction=horizontal<cr>",
  { noremap = true, desc = "Toggle terminal (horizontal)" }
)
map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { noremap = true, desc = "Toggle terminal (float)" })
-- Exit terminal with Esc
map("t", "<Esc>", "<C-\\><C-N>")

-- moves highlighted lines up (K) or down (J) in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
