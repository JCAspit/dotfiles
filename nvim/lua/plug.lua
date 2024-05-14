local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Colorschemes
Plug("rose-pine/neovim", { ['as'] = "rose=pine" })
Plug("folke/tokyonight.nvim")
Plug("catppuccin/nvim", { ['as'] = 'catppuccin' } )

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug("nvim-treesitter/playground")

Plug('theprimeagen/harpoon')
Plug('mbbill/undotree')
Plug('tpope/vim-fugitive')

-- LSP
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')

Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v3.x'} )
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- VimTex, UltiSnips, & Zathura
--Plug('lervag/vimtex')
--Plug('sirver/ultisnips') -- why is it erroring? try pip install pynvim!
--Plug('KeitaNakamura/tex-conceal.vim')

vim.call('plug#end')
