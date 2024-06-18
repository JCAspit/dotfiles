local vim = vim

vim.opt.guicursor = ""

vim.cmd.syntax(on)

vim.cmd('highlight Normal guibg=none ctermbg=none')
vim.cmd('highlight NonText guibg=none ctermbg=none')
vim.cmd('highlight Comment cterm=none gui=none')

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.wrapscan = true

vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/undodir')
vim.opt.undofile = true
vim.opt.backupdir = vim.fn.expand("$HOME/.config/nvim/backupdir")
vim.opt.backup = writebackup

local indentSize = 4
vim.opt.tabstop = indentSize 
vim.opt.shiftwidth = indentSize
vim.opt.softtabstop = indentSize
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showmode = true
vim.opt.wildmenu = true

vim.opt.mouse = off

vim.opt.updatetime = 50

vim.cmd('hi incSearch gui=none')

vim.python_host_prog='/usr/bin/python3'
