local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "stsewd/isort.nvim",
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
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = function()
      require("treesitter-context").setup {
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      }
    end,
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
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = "python", -- Load when opening Python files
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
  },
  {
    "kkoomen/vim-doge",
    event = "BufRead",
    config = function()
      vim.g.doge_doc_standard_python = "google"
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
      require("sniprun").setup {
        selected_interpreters = { "Python3_fifo" },
        repl_enable = { "Python3_fifo" },
      }
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
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    event = "VeryLazy",
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
    end,
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    },
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function()
      require("leap").set_default_mappings()
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")

      -- Skip the middle of alphabetic words:
      --   foobar[quux]
      --   ^----^^^--^^
      require("leap").opts.preview_filter = function(ch0, ch1, ch2)
        return not (ch1:match "%s" or ch0:match "%a" and ch1:match "%a" and ch2:match "%a")
      end
      require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
      require("leap.user").set_repeat_keys("<enter>", "<backspace>")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "sioyek"
    end,
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
      }
    end,
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   lazy = true,
  --   -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
  --   -- modified.
  --   keys = {
  --     {
  --       "<leader>db",
  --       function()
  --         require("dap").toggle_breakpoint()
  --       end,
  --       desc = "Toggle Breakpoint",
  --     },
  --
  --     {
  --       "<leader>dc",
  --       function()
  --         require("dap").continue()
  --       end,
  --       desc = "Continue",
  --     },
  --
  --     {
  --       "<leader>dC",
  --       function()
  --         require("dap").run_to_cursor()
  --       end,
  --       desc = "Run to Cursor",
  --     },
  --
  --     {
  --       "<leader>dT",
  --       function()
  --         require("dap").terminate()
  --       end,
  --       desc = "Terminate",
  --     },
  --   },
  -- },
  --
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   ---@type MasonNvimDapSettings
  --   opts = {
  --     -- This line is essential to making automatic installation work
  --     -- :exploding-brain
  --     handlers = {},
  --     automatic_installation = {
  --       -- These will be configured by separate plugins.
  --       exclude = {
  --         "delve",
  --         "python",
  --       },
  --     },
  --     -- DAP servers: Mason will be invoked to install these if necessary.
  --     ensure_installed = {
  --       "bash",
  --       "codelldb",
  --       "php",
  --       "python",
  --     },
  --   },
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "williamboman/mason.nvim",
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   lazy = true,
  --   config = function()
  --     local python = vim.fn.expand "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(python)
  --   end,
  --   -- Consider the mappings at
  --   -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   },
  -- },
  -- {
  --   "theHamsta/nvim-dap-virtual-text",
  --   config = true,
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   },
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = true,
  --   keys = {
  --     {
  --       "<leader>du",
  --       function()
  --         require("dapui").toggle {}
  --       end,
  --       desc = "Dap UI",
  --     },
  --   },
  --   dependencies = {
  --     "jay-babu/mason-nvim-dap.nvim",
  --     "leoluz/nvim-dap-go",
  --     "mfussenegger/nvim-dap-python",
  --     "nvim-neotest/nvim-nio",
  --     "theHamsta/nvim-dap-virtual-text",
  --   },
  -- },
}
