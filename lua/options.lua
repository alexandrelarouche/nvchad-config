require "nvchad.options"

-- add yours here!
-- -- Set timeout to 2000ms
-- vim.o.timeoutlen = 2000

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
vim.diagnostic.config {
  virtual_text = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
}
