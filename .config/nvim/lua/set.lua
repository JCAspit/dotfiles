local vim = vim

vim.wo.relativenumber = true
vim.wo.number		  = true

vim.opt.scrolloff = 8
vim.opt.wrap	  = false
vim.opt.wrapscan  = true		-- Searchs wrap around the end of the file

-- Indenting --
local indentSize	= 4
vim.opt.tabstop		= indentSize
vim.opt.shiftwidth	= indentSize
vim.opt.softtabstop	= indentSize
vim.opt.smartindent	= true
vim.opt.autoindent	= true

-- Misc --
vim.opt.ruler	   = true
vim.opt.cursorline = true
vim.opt.showmode   = true
vim.opt.wildmenu   = true

-- Searching --
vim.opt.hlsearch  = false		-- Highlight all search matches
vim.opt.incsearch = true		-- Highlight search matches as it's being typed

-- Whitespace --
-- > · ▸ ¬ ↵ ⍿ ×
--vim.opt.list = true
--vim.opt.listchars="tab:⍿·,eol:·,trail:×"
--vim.opt.invlist

-- Undo / Backups --
local config = vim.fn.stdpath("config")

vim.opt.undofile = true
vim.opt.undodir = config.. "/undodir"

vim.opt.backup = on
vim.opt.writebackup = on
vim.opt.backupdir = config.. "backupdir"

-- Misc --
vim.opt.termguicolors = true	-- Enable 24-bit color
vim.opt.guicursor = ""			-- Disable cursor styling
vim.opt.mouse = "nvi"
--vim.opt.updatetime = 50
vim.cmd.syntax(on)				-- Separate from treesitter
--vim.cmd('filetype plugin on')

--vim.cmd('highlight Normal guibg=none ctermbg=none')
--vim.cmd('highlight NonText guibg=none ctermbg=none')
--vim.cmd('highlight Comment cterm=none gui=none')
--vim.cmd('hi incSearch gui=none')
--vim.python_host_prog='/usr/bin/python3'
--vim.cmd('let g:vimtex_view_method = "zathura"')
--vim.cmd('let g:vimtex_compiler_method = "latexrun"')
