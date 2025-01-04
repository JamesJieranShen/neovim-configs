return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "vertical",
        -- layout_config = {
        --   width = 0.95,
        --   preview_width = 0.6
        -- }
      },
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    keys = {
      {
        "<leader>fs",
        function()
          require("telescope").extensions.frecency.frecency({
            path_display = { "smart" },
            workspace = "CWD",
            theme = "ivy",
          })
        end,
        desc = "Search by frecency",
      },
    },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
}
