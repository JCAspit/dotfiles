local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Colorschemes --
Plug("rose-pine/neovim", { ['as'] = "rose=pine" })
Plug('nordtheme/vim')
Plug("folke/tokyonight.nvim")
Plug('Everblush/nvim')

-- Utilities --
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'main', ['do'] = ':TSUpdate' })
Plug('mbbill/undotree')
Plug('theprimeagen/harpoon')
Plug('tpope/vim-surround')
Plug('tpope/vim-commentary')
Plug('barrett-ruth/live-server.nvim')
Plug('laytan/cloak.nvim')
Plug('windwp/nvim-ts-autotag')
Plug('MeanderingProgrammer/render-markdown.nvim')
Plug('akinsho/toggleterm.nvim')

-- LSP --
Plug('VonHeikemen/lsp-zero.nvim')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip') -- or untisnip below

vim.call('plug#end')
