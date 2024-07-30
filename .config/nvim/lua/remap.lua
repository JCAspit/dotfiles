local vim = vim

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pe", vim.cmd.Sex)

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set('n', "<leader>p", "\"+p")
vim.keymap.set('v', "<leader>p", "\"+p")

vim.keymap.set("x", "<leader>P", "\"_dP")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- DIE, VILE ARROW KEYS
vim.keymap.set({ 'n', 'i', 'c', 'v' }, "<Up>", "<NOP>")
vim.keymap.set({ 'n', 'i', 'c', 'v' }, "<Down>", "<NOP>")
vim.keymap.set({ 'n', 'i', 'c', 'v' }, "<Left>", "<NOP>")
vim.keymap.set({ 'n', 'i', 'c', 'v' }, "<Right>", "<NOP>")

vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")
