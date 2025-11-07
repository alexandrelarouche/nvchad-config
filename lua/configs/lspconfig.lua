-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = vim.lsp.config

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "julials" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable { lsp }
end

-- lspconfig.julials.setup {
--   on_new_config = function(new_config, _)
--     local julia = vim.fn.expand "~/.julia/environments/nvim-lspconfig/bin/julia"
--     if require("lspconfig").util.path.is_file(julia) then
--       vim.notify "Hello!"
--       new_config.cmd[1] = julia
--     end
--   end,
-- }

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
