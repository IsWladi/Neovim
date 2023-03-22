return {
  {'ellisonleao/gruvbox.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
      require('gruvbox').setup({
          disable_background = true
      })

      function ColorMyPencils(color) 
          color = color or "gruvbox"
          vim.cmd.colorscheme(color)

          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      end

      ColorMyPencils()
    end,
  },
}
