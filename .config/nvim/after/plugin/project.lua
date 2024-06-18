local projects = require('telescope').extensions.projects
--local project_nvim = require("project_nvim")

vim.keymap.set("n", "<C-f>", function() projects.projects{} end)
