return {
  {
    "vague-theme/vague.nvim",
    lazy = false,
    config = function()
      require("vague").setup({
        transparent = true,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        styles = { transparency = false },
      })
    end,
  },
  { "2giosangmitom/nightfall.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
