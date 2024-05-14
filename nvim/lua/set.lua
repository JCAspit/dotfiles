vim.opt.guicursor = ""

vim.cmd.syntax(on)

vim.cmd('highlight Normal guibg=none ctermbg=none')
vim.cmd('highlight NonText guibg=none ctermbg=none')

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.wrapscan = true

vim.opt.undodir = "C:/Users/J/Documents/.vim/undodir"
vim.opt.undofile = true
vim.opt.backup = false

vim.opt.smartindent = true

local indentSize = 4
vim.opt.tabstop = indentSize 
vim.opt.shiftwidth = indentSize
vim.opt.softtabstop = indentSize
vim.opt.smartindent = true

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
