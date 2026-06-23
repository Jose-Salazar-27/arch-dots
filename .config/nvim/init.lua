-- bootstrap lazy.nvim, LazyVim and your plugins
-- Set terminal gui colors to true
-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.o.completeopt = "menuone,noselect"

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

vim.o.termguicolors = true
-- vim.highlight.priorities.semantic_tokens = 95
require("config.globals")
require("config.lazy")

vim.opt.winblend = 0
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTree", { bg = "none" })

local noice_highlights = {
  "NoiceCmdlinePopup",
  "NoiceCmdlinePopupBorder",
  "NoiceCmdlineNormal",
  "NoiceCmdlineBorder",
  "NoicePopup",
  "NoicePopupBorder",
  "NormalFloat",
  "FloatBorder",
}

for _, group in ipairs(noice_highlights) do
  vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end

local neotree_highlights = {
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeSignColumn",
  "NeoTreeStatusLine",
  "NeoTreeStatusLineNC",
  "NeoTreeVertSplit",
  "NeoTreeWinSeparator",
  "NeoTreeEndOfBuffer",
}

for _, group in ipairs(neotree_highlights) do
  vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end
