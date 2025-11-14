return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        doc = {
          max_width = 120,
          inline = true,
          float = true,
        },
        math = {
          latex = {
            font_size = "normalsize",
            tpl = [[
              \documentclass[preview,border=0pt,varwidth=400mm,12pt]{standalone}
              \usepackage{${packages}}
              \begin{document}
              ${header}
              { \${font_size} \selectfont
                \color[HTML]{${color}}
              ${content}}
              \end{document}]],
          },
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      -- Disable math images while typing
      vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function(ev)
          Snacks.image.config.math.enabled = false
          Snacks.image.doc.attach(ev.buf)
        end,
      })

      -- Re-enable math images when leaving insert mode
      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function(ev)
          Snacks.image.config.math.enabled = true
          Snacks.image.doc.attach(ev.buf)
        end,
      })
    end,
  },
}
