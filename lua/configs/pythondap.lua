require("dap-python").setup "python"

require("dap-python").setup "debugpy-adapter" -- or uv, or path to python, see #usage
table.insert(require("dap").configurations.python, {
  type = "python",
  request = "launch",
  name = "Default launch",

  -- `program` is what you'd use in `python <program>` in a shell
  -- If you need to run the equivalent of `python -m <module>`, replace
  -- `program = '${file}` entry with `module = "modulename"
  program = "${file}",

  console = "integratedTerminal",

  -- Other options:
  -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})

table.insert(require("dap").configurations.python, {
  type = "python",
  request = "launch",
  name = "Launch file with arguments",
  program = "${file}",
  args = function()
    local args_string = vim.fn.input "Arguments: "
    return vim.split(args_string, " +")
  end,
})

-- require("dap-python").resolve_python = function()
--   return "python"
-- end
