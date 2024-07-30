require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
-- disable luarocks because lua 5.1 not available at school ? what plugins would require it?

local g = {
  dap_virtual_text = true,
  bookmark_sign = "",
  skip_ts_context_commentstring_module = true,
}

local opt = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  spelllang = {"en", "fr"},
  clipboard = "unnamedplus",
  -- Folds
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldcolumn = "0",
  foldtext = "",
  foldlevel = 99,
  foldlevelstart = 1,
  foldnestmax = 1,
  -- Prevent issues with some language servers
  backup = false,
  swapfile = false,
  -- Always show minimum n lines after/before current line
  scrolloff = 10,
  -- True color support
  termguicolors = true,
  emoji = false,
  -- Line break/wrap behaviours
  number = true,
  relativenumber = true,
  wrap = true,
  linebreak = true,
  showbreak = "↪",
  textwidth = 0,
  wrapmargin = 0,
  -- Indentation values
  tabstop = 2,
  shiftwidth = 0, -- 0 forces same value as tabstop
  softtabstop = 2,
  expandtab = true,
  autoindent = true,
  cursorline = true,
  cursorlineopt = "both",
  inccommand = "split",
  ignorecase = true,
  updatetime = 100,
  lazyredraw = false,
  -- iskeyword = vim.opt.iskeyword:append { "_", "@", ".", "-" },
  -- path = vim.opt.path:append { "**", "lua", "src" },
  -- cmp behaviours
  pumheight = 10,
  pumblend = 10,
  -- pop-up window
  winblend = 10,
  -- diff options
}

for k, v in pairs(g) do
  vim.g[k] = v
end

for k, v in pairs(opt) do
  vim.opt[k] = v
end

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})
