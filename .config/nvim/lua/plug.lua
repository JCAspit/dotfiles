local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Colorschemes
Plug("rose-pine/neovim", { ['as'] = "rose=pine" })
Plug("folke/tokyonight.nvim")
Plug("nordtheme/vim")
--Plug("lunarvim/synthwave84.nvim")
--Plug("lunarvim/darkplus.nvim")
--Plug("catppuccin/nvim", { ['as'] = 'catppuccin' } )
--Plug("ellisonleao/gruvbox.nvim")

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim'--[[, { ['tag'] = '0.1.6' }]])

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
--Plug("nvim-treesitter/playground")

Plug('theprimeagen/harpoon')
Plug('mbbill/undotree')
--Plug('tpope/vim-fugitive')

--Plug("windwp/nvim-autopairs")
Plug('tpope/vim-surround')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('ahmedkhalf/project.nvim')
Plug('wellle/context.vim')
--Plug('RRethy/vim-illuminate')
--Plug('jvgrootveld/telescope-zoxide')
--Plug('lewis6991/gitsigns.nvim')
--Plug('folke/trouble.nvim')
--Plug('folke/which-key.nvim')
--Plug('xiyaowong/transparent.nvim')
--Plug('epwalsh/obsidian.nvim')
--Plug('3rd/image.nvim')
--Plug('Fymyte/rasi.vim') -- DEPRECATED, MERGED INTO NVIM, UNINSTALL AFTER NEXT NVIM UPDATE

-- Silly lil colored statusline
--Plug('nvim-lualine/lualine.nvim')

-- LSP
--Plug('neovim/nvim-lspconfig')
--Plug('hrsh7th/nvim-cmp')
--Plug('hrsh7th/cmp-nvim-lsp')
--Plug('L3MON4D3/LuaSnip')

--Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v3.x'} )
--Plug('williamboman/mason.nvim')
--Plug('williamboman/mason-lspconfig.nvim')

--[[ File tree
Plug('nvim-tree/nvim-web-devicons')
Plug('MunifTanjim/nui.nvim')
Plug("nvim-neo-tree/neo-tree.nvim", {
	["branch"] = "v3.x",
	["requires"] = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim"
	}
})
]]

-- LaTeX
--Plug('lervag/vimtex')
--Plug('KeitaNakamura/tex-conceal.vim')
--Plug('dylanaraps/pywal')
--Plug('sirver/ultisnips') -- why is it erroring? try pip install pynvim!

vim.call('plug#end')

--require('lualine').setup()
--require("nvim-autopairs").setup()
require("ibl").setup()
--require('gitsigns').setup()
require("project_nvim").setup {}
require('telescope').load_extension('projects')
--require("catppuccin").setup({
--	integrations = {
--		gitsigns = true,
--		treesitter = true,
--	}
--})

