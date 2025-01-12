local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "pyright",
        "julia-lsp",
        "jupytext",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },
  {
    "rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      -- "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    -- lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "kkoomen/vim-doge",
    event = "BufRead",
    config = function()
      -- vim.cmd([[call doge#install()]])
      vim.g.doge_doc_standard_python = "numpy"
    end,
  },
  {
    "nvim-pack/nvim-spectre",
  },
  {
    "filipdutescu/renamer.nvim",
    config = function()
      require("renamer").setup()
    end,
  },
  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    config = function()
      require("sniprun").setup()
    end,
    ft = { "python", "julia" },
  },
  {
    "JuliaEditorSupport/julia-vim",
  },
  -- This is the same config as NvChad, but does not lazy load to avoid visual mode <leader> not triggering load
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
    lazy = false,
  },
}
