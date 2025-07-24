local vim = vim

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls", "vimls", "rust_analyzer", "jdtls", "ts_ls" },
	automatic_enable = true,
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})
		end
	}
})

-- Only bind keymaps after a language server starts
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
	callback = function(event)
		local opts = { buffer = event.buf }
		-- Slightly different keybinds are builtin since Neovim >=v0.11
		vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
		vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set('n', '[d', function()
			local next = vim.diagnostic.get_next()
			local jumpOpts = vim.diagnostic.JumpOpts({ diagnostic = next })
			vim.diagnostic.jump(jumpOpts)
		end, opts)
		vim.keymap.set('n', ']d', function()
			local next = vim.diagnostic.get_prev()
			local jumpOpts = vim.diagnostic.JumpOpts({ diagnostic = next })
			vim.diagnostic.jump(jumpOpts)
		end, opts)
		vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
		vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

		-- Builtin autocomplete since Neovim v0.11
		--local client = vim.lsp.get_client_by_id(event.data.client_id)
		--if client:supports_method('textDocument/completion') then
		--	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = false })
		--end
	end
})

-- Default opt-/in/ since Neovim v0.11
vim.diagnostic.config({
	virtual_text = true,
	-- OR
	-- virtual_text = {
	-- 	current_line = true
	-- }
})

-- Alternatively, see 'lsp_lines.nvim' by @WhyNotHugo on GitHub
-- Plugin was merged into upstream
-- vim.diagnostic.config({
-- 	virtual_lines = true,
-- 	-- OR
-- 	-- virtual_lines = {
-- 	-- 	current_line = true
-- 	-- }
-- })
