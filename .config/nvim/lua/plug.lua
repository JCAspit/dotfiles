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
--Plug('lukas-reineke/indent-blankline.nvim')
--Plug('ahmedkhalf/project.nvim')
--Plug('wellle/context.vim')
--Plug('RRethy/vim-illuminate')
--Plug('jvgrootveld/telescope-zoxide')
--Plug('lewis6991/gitsigns.nvim')
--Plug('folke/trouble.nvim')
--Plug('folke/which-key.nvim')
--Plug('xiyaowong/transparent.nvim')
--Plug('epwalsh/obsidian.nvim')
--Plug('3rd/image.nvim')
--Plug('Fymyte/rasi.vim') -- DEPRECATED, MERGED INTO NVIM, UNINSTALL AFTER NEXT NVIM UPDATE
--Plug('tpope/vim-vinegar')
--Plug('ziontee113/color-picker')
Plug('barrett-ruth/live-server.nvim')
Plug('laytan/cloak.nvim')


-- Silly lil colored statusline
--Plug('nvim-lualine/lualine.nvim')

-- LSP
--Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('windwp/nvim-ts-autotag')
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
require('nvim-ts-autotag').setup()
--require("ibl").setup()
--require('gitsigns').setup()
--require("project_nvim").setup {}
--require('telescope').load_extension('projects')
--require("catppuccin").setup({
--	integrations = {
--		gitsigns = true,
--		treesitter = true,
--	}
--})
require('live-server').setup{
	args = { '--port=8080', '--browser=firefox' }
}
require('cloak').setup({
	enabled = true,
	cloak_character = '*',
	-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
	highlight_group = 'Comment',
	-- Applies the length of the replacement characters for all matched
	-- patterns, defaults to the length of the matched pattern.
	cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
	-- Whether it should try every pattern to find the best fit or stop after the first.
	try_all_patterns = true,
	-- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
	cloak_telescope = true,
	-- Re-enable cloak when a matched buffer leaves the window.
	cloak_on_leave = true,
	patterns = {
		{
			-- Match any file starting with '.env'.
			-- This can be a table to match multiple file patterns.
			file_pattern = '.env*',
			-- Match an equals sign and any character after it.
			-- This can also be a table of patterns to cloak,
			-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
			cloak_pattern = '=.+',
			-- A function, table or string to generate the replacement.
			-- The actual replacement will contain the 'cloak_character'
			-- where it doesn't cover the original text.
			-- If left empty the legacy behavior of keeping the first character is retained.
			replace = nil,
		},
	}
})

