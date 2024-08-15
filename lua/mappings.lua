require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Quit all opened buffers
map("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })


map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

map("n", "]t", function()
  require("todo-comments").jump_next { keywords = { "ERROR", "WARNING" } }
end, { desc = "Next error/warning todo comment" })

map("n", "<leader>dt", function()
    require("dapui").close()
end, { desc = "Toggle debugger ui"})
