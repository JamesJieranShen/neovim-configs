return {
  { "vague-theme/vague.nvim",
    lazy=false,
    config = function()
      require("vague").setup({
        transparent = true,
      })
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vague",
    },
  },
}
