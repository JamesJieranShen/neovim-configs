-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

local opt = vim.opt
opt.relativenumber = false -- Relative line numbers
opt.clipboard = "unnamedplus"
vim.schedule(function() -- and schedule...
  vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
end)
vim.g.lazyvim_python_lsp="basedpyright"

-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = true

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
vim.g.molten_image_provider = "image.nvim"

-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true
vim.g.molten_output_win_max_height = 36

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
vim.g.molten_virt_text_output = false

vim.g.molten_virt_text_max_lines = 36

-- this will make it so the output shows up below the \`\`\` cell delimiter
vim.g.molten_virt_lines_off_by_1 = true
