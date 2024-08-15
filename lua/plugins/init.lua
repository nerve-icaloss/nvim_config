return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Mason install list
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP --
        "lua-language-server",
        "bash-languge-server",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "json-lsp",
        "nginx-language-server",

        -- DAP --
        "cpptools",
        -- Linter
        -- "es_lint_d", (web)
        -- "cpplint"
        -- "pylint",

        -- Formatter --
        "stylua",
        "prettier",
        "clangd-format",
        "isort",
        "black",
      },
    },
  },

  -- Treesitter install list
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "bash",
        "html",
        "css",
        "javascript",
        "json",
        "c",
        "cpp",
        "python",
        "markdown",
      },
    },
  },

  -- Workplace bookmark tool
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    cmd = { "WorkspacesList", "WorkspacesAdd", "WorkspacesOpen", "WorkspacesRemove" },
    config = function()
      require("workspaces").setup {
        hooks = {
          open = "Telescope find_files",
        },
      }
    end,
  },

  ------ DAP Extensions
  -- DAP plugin
  require "configs.nvim-dap",
  -- -- DAP Mason adapter
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   require("mason").setup(),
  --   require("mason-nvim-dap").setup {
  --     ensure_installed = { "cppdbg", "python" },
  --   },
  -- },
  -- DAP UI plugin
  require "configs.nvim-dap-ui",
  -- Virtual Text Variables
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = { enabled = false },
    keys = { { "<A-f>", "<CMD>DapVirtualTextToggle<CR>", desc = "Toggle DAP Virtual Text" } },
  },

  -- Comment listing tool
  require "configs.todo-comment",
}

-- -- Auto format tools
-- {
--   "sbdchd/neoformat",
--   lazy = true,
--   cmd = { "Neoformat" }
-- },

-- -- Highlight URLs inside vim
-- {
--   "itchyny/vim-highlighturl",
--   event = "VeryLazy"
-- },

-- -- Fancy start screen
-- {
--   "nvimdev/dashboard-nvim",
--   cond = firenvim_not_active,
--   lazy = false; -- required ??
--   config = function()
--     require("config.dashboard-nvim")
--   end,
-- },

-- -- Notification plugin
-- {
--   "rcarriga/nvim-notify",
--   event = "VeryLazy",
--   config = function()
--   vim.defer_fn(function()
--       require("config.nvim-notify")
--   end, 2000)
--   end,
-- },

-- -- Diff tool
-- {
--   "sindrets/diffview.nvim",
--   lazy = true,
--   cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
-- }
