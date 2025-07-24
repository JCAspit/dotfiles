local cmp = require('cmp')

cmp.setup({
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'luasnip' },
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), -- :h cmp.select_next_item
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Select, select = true }, { "i", "s", "c" }),
		['<C-e>'] = cmp.mapping.abort()
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

