return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json5 = { "prettier" },
      -- or force json files to use json5 parser
      json = { "prettier" },
    },
    formatters = {
      prettier = { extra_args = { "--parser", "json5" } },
    },
  },
}

