--local lsp_zero = require('lsp-zero')
--
--lsp_zero.on_attach(function(client, bufnr)
--	-- see :help lsp-zero-keybindings
--	-- to learn the available actions
--	lsp_zero.default_keymaps({buffer = bufnr})
--end)
--
--require('mason').setup({})
--require('mason-lspconfig').setup({
--	ensure_installed = {'tsserver', 'rust_analyzer', 'jdtls'},
--	handlers = {
--		function(server_name)
--			require('lspconfig')[server_name].setup({})
--		end,
--	},
--})
--
--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp_zero.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true }),
--	['<C-Space>'] = cmp.mapping.complete()
--})


local vim = vim

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
							},
							userThirdParty = { "~/Documents/devel/LLS-Addons" },
							library = { "~/Documents/devel/LLS-Addons/lua-ls-cc-tweaked/library" }
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
