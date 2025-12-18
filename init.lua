
-- VIM API Commands
vim.cmd([[
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  colorscheme habamax 
]])

vim.g.mapleader = " "


-- Lazy Package Manager
require("config.lazy")
-- Setup Lazy
require("lazy").setup("plugins")


