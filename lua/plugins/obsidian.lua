return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      -- refer to `:h file-pattern` for more examples
      "BufReadPre /home/james/Documents/BONOTA-obsidian",
      "BufNewFile /home/james/Documents/BONOTA-obsidian",
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      note_id_func = function(title)
        return title
      end,
      workspaces = {
        {
          name = "BONOTA",
          path = "/home/james/Documents/BONOTA-obsidian",
        },
      },
      attachments = {
        img_folder = "attachments",
      },
    },
    init = function()
      -- automatically disable diagnostics for obsidian notes
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufEnter" }, {
        group = vim.api.nvim_create_augroup("ObsidianDiagnostics", { clear = true }),
        callback = function(args)
          local ok, obs = pcall(require, "obsidian.api")
          if not ok then
            return
          end
          local path = vim.api.nvim_buf_get_name(args.buf)

          if obs.path_is_note(path) then
            -- turn OFF diagnostics for this buffer
            Snacks.toggle.diagnostics():set(false)
          -- alternative: vim.diagnostic.disable(args.buf)  -- plain Neovim API
          else
            -- turn ON diagnostics for this buffer
            Snacks.toggle.diagnostics():set(true)
            -- alternative: vim.diagnostic.enable(args.buf)
          end
        end,
      })
      -- Ctrl+Shift+V to paste images into obsidian notes
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("ObsidianPasteKeymap", { clear = true }),
        callback = function(args)
          local ok, obs = pcall(require, "obsidian.api")
          if not ok then
            return
          end

          local path = vim.api.nvim_buf_get_name(args.buf)
          if obs.path_is_note(path) then
            -- Define buffer-local keymap for Ctrl+Shift+V
            vim.keymap.set("n", "<leader>vp", function()
              vim.cmd("ObsidianPasteImg")
            end, { buffer = args.buf, desc = "Paste image into Obsidian note" })
          end
        end,
      })
    end,
  },

  -- make sure images are shown in the notes
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        resolve = function(path, src)
          if require("obsidian.api").path_is_note(path) then
            return require("obsidian.api").resolve_image_path(src)
          end
        end,
      },
    },
  },
}
