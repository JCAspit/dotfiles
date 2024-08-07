local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Colorschemes --
Plug("rose-pine/neovim", { ['as'] = "rose=pine" })
Plug("folke/tokyonight.nvim")

-- Utilities --
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
--Plug("nvim-treesitter/playground")

Plug('theprimeagen/harpoon')
Plug('mbbill/undotree') --
--Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('barrett-ruth/live-server.nvim')
Plug('laytan/cloak.nvim')
Plug('windwp/nvim-ts-autotag')

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

-- LaTeX --
--[[
Plug('lervag/vimtex')
Plug('KeitaNakamura/tex-conceal.vim')
Plug('dylanaraps/pywal')
Plug('sirver/ultisnips') -- why is it erroring? try pip install pynvim!
]]

vim.call('plug#end')

-- Setup --

require('nvim-ts-autotag').setup()

require('live-server').setup{
	args = { '--port=8080', '--browser=firefox' }
}

require('cloak').setup({
	enabled = true,
	cloak_character = '*',
	highlight_group = 'Comment',
	cloak_length = nil,
	try_all_patterns = true,
	cloak_telescope = true,
	cloak_on_leave = true,
	patterns = {
		{
			file_pattern = '.env*',
			cloak_pattern = '=.+',
			replace = nil,
		},
	}
})

-- LSP Setup --
-- Stolen from https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Still LSP Setup --
require('mason').setup()
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({
				capabilities = lsp_capabilities,
			})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = {'vim'},
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							}
						}
					}
				}
			})
		end,
	}
})

-- Gosh Also Still LSP Setup --
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
			--vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-e>'] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		--{ name = 'ultisnips' },
		{ name = 'path' },
		{ name = 'buffer' },
	}, {
		{ name = 'buffer' },
	})
})
