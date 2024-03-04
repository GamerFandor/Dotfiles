-- Editor settings for NeoVim

local set = vim.opt

set.number = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undofile = true
set.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8
set.isfname:append("@-@")

set.updatetime = 50

