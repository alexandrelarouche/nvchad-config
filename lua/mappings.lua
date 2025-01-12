require "nvchad.mappings"

-- map('n', 'R', '<Nop>')
-- These disable replace mode
vim.api.nvim_set_keymap("n", "R", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "r", "<Nop>", { noremap = true, silent = true })
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>oi", "<cmd>PyrightOrganizeImports<cr>", { desc = "Organize Imports" })
map("n", "<leader>Rr", ":!%:p", { desc = "Run File" })
-- map("n", "<leader>vs", "<cmd>VenvSelect<cr>", {desc="Select Venv"})

-- Spectre
map("n", "<leader>Ss", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })

-- Sniprun
map({ "n", "v" }, "<leader>rr", "<Plug>SnipRun", { desc = "SnipRun Run" })
map({ "n", "v" }, "<leader>rb", "<Plug>SnipReset", { desc = "SnipRun Reset" })
map({ "n", "v" }, "<leader>rc", "<Plug>SnipClose", { desc = "SnipRun Close" })
