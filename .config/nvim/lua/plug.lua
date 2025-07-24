local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Colorschemes --
Plug("rose-pine/neovim", { ['as'] = "rose=pine" })
Plug("folke/tokyonight.nvim")

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
Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason-lspconfig.nvim')

-- Autocomplete --
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')

Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

vim.call('plug#end')
