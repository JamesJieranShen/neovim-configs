-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

local opt = vim.opt
opt.relativenumber = false -- Relative line numbers
-- opt.clipboard = "unnamedplus"
vim.schedule(function() -- and schedule...
  opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
end)
vim.g.lazyvim_python_lsp = "basedpyright"

vim.filetype.add({
  extension = {
    json = "json5",
  },
})
vim.keymap.set("n", "<leader>o", "<cmd>Ex<cr>", { desc = "Open file explorer" })
