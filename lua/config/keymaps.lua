-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>o", "<cmd>Ex<cr>", { desc = "Open file explorer" })
local vault_path = "~/Documents/BONOTA-obsidian/"
vim.keymap.set("n", "<leader>v", function()
      vim.cmd("cd " .. vault_path)
      require("snacks").picker.files({ cwd = vault_path })
    end, { desc = "Open Obsidian vault in Neovim" })
