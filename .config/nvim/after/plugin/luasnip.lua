local vim = vim

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

ls.cleanup() -- Get rid of existing snippets
for _, snippets in pairs(vim.api.nvim_get_runtime_file("snippets/*", true)) do
	loadfile(snippets)()
end
