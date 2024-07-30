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
        -- LSP
        "lua-language-server",
        "bash-languge-server",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "json-lsp",
        -- DAP
        "cpptools",
        -- Linter
        -- "es_lint_d", (web)
        -- "cpplint"
        -- "pylint",
        -- Formatter
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
    keys = { { "<A-v>", "<CMD>DapVirtualTextToggle<CR>", desc = "Toggle DAP Virtual Text" } },
  },

  -- TODO and other comment option tool
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false, -- required ??
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTI", "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "HERE" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg,
        -- but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
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
