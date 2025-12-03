-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Indenting correctly after { etc
vim.opt.smartindent = true

-- Copy indent from current line when starting new line
vim.opt.autoindent = true

-- Persistant undo file history
vim.opt.undofile = true

-- Better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Enable highlighting search in progress
vim.opt.incsearch = true

-- Ignore case for searches
vim.opt.ignorecase = true

-- Enable case-sensitive search when uppercase letter present
vim.opt.smartcase = true

-- bordered popups
vim.opt.winborder = "rounded"

-- Auto update file if changed externally
vim.opt.autoread = true

-- Remove or modify the 'leadmultispace' and 'tab' characters in listchars
vim.opt.listchars = {
  tab = "  ", -- Two spaces, effectively hiding the guide character
  leadmultispace = "  ",
  -- ... other listchars settings ...
}
