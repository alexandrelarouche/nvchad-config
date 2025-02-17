require "nvchad.mappings"

-- map('n', 'R', '<Nop>')
-- These disable replace mode
vim.api.nvim_set_keymap("n", "R", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "r", "<Nop>", { noremap = true, silent = true })
-- Disable `s` in normal mode which conflict with mini.surround

-- Navigate visual lines instead of editor lines
vim.api.nvim_set_keymap("n", "j", [[v:count == 0 ? "gj" : "j"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", [[v:count == 0 ? "gk" : "k"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "<Down>", [[v:count == 0 ? "gj" : "j"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "<Up>", [[v:count == 0 ? "gk" : "k"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<Down>", "<C-o>gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Up>", "<C-o>gk", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("i", "j", [[v:count == 0 ? "gj" : "j"]], { noremap = true, expr = true })
-- vim.api.nvim_set_keymap("i", "k", [[v:count == 0 ? "gk" : "k"]], { noremap = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<Down>", [[v:count == 0 ? "gj" : "j"]], { noremap = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<Up>", [[v:count == 0 ? "gk" : "k"]], { noremap = true, expr = true })

local map = vim.keymap.set

map({ "i", "n" }, "<C-gk>", "<Up>", { desc = "Move up" })
map({ "i", "n" }, "<C-gj>", "<Down>", { desc = "Move down" })

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

-- Disable `s` that removes a character (conflict with mini.surround)
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>")
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float)
