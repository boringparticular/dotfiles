vim.opt.encoding = 'utf-8'
vim.opt.fileformat = 'unix'
vim.opt.fileencoding = 'utf-8'
vim.opt.guifont = 'FiraCode Nerd Font 12'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cmdheight = 2
vim.opt.history = 1000

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.colorcolumn = '80'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('$HOME/') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.spelllang = { 'en_us', 'de_de' }
vim.opt.spell = true

vim.opt.updatetime = 50
vim.opt.timeoutlen = 1000

vim.opt.list = true
vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')
